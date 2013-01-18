#include "ruby.h"
#include "pHash.h"

static VALUE image_hash_with_algo_for(VALUE self, VALUE _filename, VALUE algo) {
    char * filename = StringValuePtr(_filename);
    ulong64 hash;

    int n;
    uint8_t * mhHash;

    VALUE byteArray;

    if (algo == ID2SYM(rb_intern("dct"))) {
      if (-1 == ph_dct_imagehash(filename, hash)) {
        rb_raise(rb_eRuntimeError, "Unknown pHash error");
      }
      return ULL2NUM(hash);

    } else if (algo == ID2SYM(rb_intern("mh"))) {

      mhHash = ph_mh_imagehash(filename, n);
      byteArray = rb_ary_new2(long(n));

      for(int i = 0; i < n; i++) 
        rb_ary_push(byteArray, ULL2NUM(mhHash[i]));

      return byteArray;
      
    } else {
      rb_raise(rb_eRuntimeError, "Unknown pHash algo");
    }
}

static VALUE hamming_distance(VALUE self, VALUE a, VALUE b) {
    int result = 0;
    result = ph_hamming_distance(NUM2ULL(a), NUM2ULL(b));
    if (-1 == result) {
      rb_raise(rb_eRuntimeError, "Unknown pHash error");
    }
    return INT2NUM(result);
}

static VALUE hamming_distance2(VALUE self, VALUE a, VALUE b) {
    int result = 0;
    uint8_t hash1[32];
    uint8_t hash2[32];

    for(int i = 0; i < 32; i++) 
      hash1[i] = NUM2ULL(rb_ary_entry(a,i));

    for(int i = 0; i < 32; i++) 
      hash2[i] = NUM2ULL(rb_ary_entry(b,i));

    result = ph_hammingdistance2(hash1, 32, hash2, 32);

    if (-1 == result) {
      rb_raise(rb_eRuntimeError, "Unknown pHash error");
    }

    return INT2NUM(result);
}


#ifdef __cplusplus
extern "C" {
#endif
  void Init_phashion_ext() {
    VALUE c = rb_cObject;
    c = rb_const_get(c, rb_intern("Phashion"));

    rb_define_singleton_method(c, "hamming_distance", (VALUE(*)(ANYARGS))hamming_distance, 2);
    rb_define_singleton_method(c, "hamming_distance2", (VALUE(*)(ANYARGS))hamming_distance2, 2);
    rb_define_singleton_method(c, "image_hash_with_algo_for", (VALUE(*)(ANYARGS))image_hash_with_algo_for, 2);
  }
#ifdef __cplusplus
}
#endif
