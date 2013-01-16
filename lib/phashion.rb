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
    end

    def duplicate?(other, algo=SETTINGS[:algo])
      Phashion.hamming_distance(fingerprint(algo), other.fingerprint(algo)) < SETTINGS[:dupe_threshold]
    end

    def fingerprint(algo=SETTINGS[:algo])
      @hash ||= Phashion.image_hash_for(@filename, algo)
    end

  end

  def self.image_hash_for(filename, algo=nil)
    algo ||= Image::SETTINGS[:algo]
    image_hash_with_algo_for(filename, algo)
  end
end

require 'phashion_ext'
