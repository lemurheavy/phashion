##
# Provides a clean and simple API to detect duplicate image files using
# the pHash library under the covers.
#
# The C API:
# int ph_dct_imagehash(const char *file, ulong64 &hash);
# int ph_mh_imagehash(const char *file, ulong64 &hash);
# int ph_hamming_distance(ulong64 hasha, ulong64 hashb);

# Settings
#
# algo:
#   dct - DCT hash
#   mh  - Marr/Mexican hat wavelet

module Phashion
  VERSION = '1.0.5'

  class Image
    SETTINGS = {
      :dupe_threshold => 15,
      :algo => :dct
    }

    attr_reader :filename
    def initialize(filename)
      @filename = filename
      @hash = {}
    end

    def duplicate?(other, algo=SETTINGS[:algo])
      if algo == :mh
        hd = Phashion.mh_hamming_distance(mh_fingerprint, other.mh_fingerprint)
        puts "hd: #{hd}"
        hd
      else
        Phashion.hamming_distance(fingerprint(algo), other.fingerprint(algo))
      end < SETTINGS[:dupe_threshold]
    end

    def fingerprint(algo=SETTINGS[:algo])
      @hash[algo] ||= Phashion.image_hash_for(@filename, algo)
    end

    def mh_fingerprint
      fingerprint(:mh).inject(""){|str, a| str += a.to_s(2).rjust(8, '0')}.to_i(2)
    end

  end

  def self.image_hash_for(filename, algo=nil)
    algo ||= Image::SETTINGS[:algo]
    image_hash_with_algo_for(filename, algo)
  end

  def self.mh_hamming_distance(f1, f2)
    xor = (f1 ^ f2).to_s(2)
    (xor.gsub(/0/,'').length / xor.length.to_f * 100).round
  end
end

require 'phashion_ext'
