file(GLOB WOWMV_SOURCES RELATIVE ${CMAKE_SOURCE_DIR} *.cpp)
list(REMOVE_ITEM WOWMV_SOURCES particle_test.cpp modelexport_fbx.cpp RenderTexture.cpp AVIGenerator.cpp)
if (USE_STORM)
    list(REMOVE_ITEM WOWMV_SOURCES mpq_libmpq.cpp)
else ()
    list(REMOVE_ITEM WOWMV_SOURCES mpq_stormlib.cpp)
endif ()

set(STORM_SOURCES
    stormlib/src/adpcm/adpcm.cpp
    stormlib/src/huffman/huff.cpp
    stormlib/src/sparse/sparse.cpp
    stormlib/src/FileStream.cpp
    stormlib/src/SCommon.cpp
    stormlib/src/SCompression.cpp
    stormlib/src/SFileAddFile.cpp
    stormlib/src/SFileAttributes.cpp
    stormlib/src/SFileCompactArchive.cpp
    stormlib/src/SFileCreateArchive.cpp
    stormlib/src/SFileExtractFile.cpp
    stormlib/src/SFileFindFile.cpp
    stormlib/src/SFileListFile.cpp
    stormlib/src/SFileOpenArchive.cpp
    stormlib/src/SFileOpenFileEx.cpp
    stormlib/src/SFilePatchArchives.cpp
    stormlib/src/SFileReadFile.cpp
    stormlib/src/SFileVerify.cpp
    stormlib/src/libtomcrypt/src/hashes/hash_memory.c
    stormlib/src/libtomcrypt/src/hashes/md5.c
    stormlib/src/libtomcrypt/src/hashes/sha1.c
    stormlib/src/libtomcrypt/src/math/ltm_desc.c
    stormlib/src/libtomcrypt/src/math/multi.c
    stormlib/src/libtomcrypt/src/math/rand_prime.c
    stormlib/src/libtomcrypt/src/misc/base64_decode.c
    stormlib/src/libtomcrypt/src/misc/crypt_argchk.c
    stormlib/src/libtomcrypt/src/misc/crypt_find_hash.c
    stormlib/src/libtomcrypt/src/misc/crypt_find_prng.c
    stormlib/src/libtomcrypt/src/misc/crypt_hash_descriptor.c
    stormlib/src/libtomcrypt/src/misc/crypt_hash_is_valid.c
    stormlib/src/libtomcrypt/src/misc/crypt_libc.c
    stormlib/src/libtomcrypt/src/misc/crypt_ltc_mp_descriptor.c
    stormlib/src/libtomcrypt/src/misc/crypt_prng_descriptor.c
    stormlib/src/libtomcrypt/src/misc/crypt_prng_is_valid.c
    stormlib/src/libtomcrypt/src/misc/crypt_register_hash.c
    stormlib/src/libtomcrypt/src/misc/crypt_register_prng.c
    stormlib/src/libtomcrypt/src/misc/zeromem.c
    stormlib/src/libtomcrypt/src/pk/asn1/der_decode_bit_string.c
    stormlib/src/libtomcrypt/src/pk/asn1/der_decode_boolean.c
    stormlib/src/libtomcrypt/src/pk/asn1/der_decode_choice.c
    stormlib/src/libtomcrypt/src/pk/asn1/der_decode_ia5_string.c
    stormlib/src/libtomcrypt/src/pk/asn1/der_decode_integer.c
    stormlib/src/libtomcrypt/src/pk/asn1/der_decode_object_identifier.c
    stormlib/src/libtomcrypt/src/pk/asn1/der_decode_octet_string.c
    stormlib/src/libtomcrypt/src/pk/asn1/der_decode_printable_string.c
    stormlib/src/libtomcrypt/src/pk/asn1/der_decode_sequence_ex.c
    stormlib/src/libtomcrypt/src/pk/asn1/der_decode_sequence_flexi.c
    stormlib/src/libtomcrypt/src/pk/asn1/der_decode_sequence_multi.c
    stormlib/src/libtomcrypt/src/pk/asn1/der_decode_short_integer.c
    stormlib/src/libtomcrypt/src/pk/asn1/der_decode_utctime.c
    stormlib/src/libtomcrypt/src/pk/asn1/der_decode_utf8_string.c
    stormlib/src/libtomcrypt/src/pk/asn1/der_length_bit_string.c
    stormlib/src/libtomcrypt/src/pk/asn1/der_length_boolean.c
    stormlib/src/libtomcrypt/src/pk/asn1/der_length_ia5_string.c
    stormlib/src/libtomcrypt/src/pk/asn1/der_length_integer.c
    stormlib/src/libtomcrypt/src/pk/asn1/der_length_object_identifier.c
    stormlib/src/libtomcrypt/src/pk/asn1/der_length_octet_string.c
    stormlib/src/libtomcrypt/src/pk/asn1/der_length_printable_string.c
    stormlib/src/libtomcrypt/src/pk/asn1/der_length_sequence.c
    stormlib/src/libtomcrypt/src/pk/asn1/der_length_short_integer.c
    stormlib/src/libtomcrypt/src/pk/asn1/der_length_utctime.c
    stormlib/src/libtomcrypt/src/pk/asn1/der_length_utf8_string.c
    stormlib/src/libtomcrypt/src/pk/asn1/der_sequence_free.c
    stormlib/src/libtomcrypt/src/pk/ecc/ltc_ecc_map.c
    stormlib/src/libtomcrypt/src/pk/ecc/ltc_ecc_mul2add.c
    stormlib/src/libtomcrypt/src/pk/ecc/ltc_ecc_mulmod.c
    stormlib/src/libtomcrypt/src/pk/ecc/ltc_ecc_points.c
    stormlib/src/libtomcrypt/src/pk/ecc/ltc_ecc_projective_add_point.c
    stormlib/src/libtomcrypt/src/pk/ecc/ltc_ecc_projective_dbl_point.c
    stormlib/src/libtomcrypt/src/pk/pkcs1/pkcs_1_mgf1.c
    stormlib/src/libtomcrypt/src/pk/pkcs1/pkcs_1_oaep_decode.c
    stormlib/src/libtomcrypt/src/pk/pkcs1/pkcs_1_pss_decode.c
    stormlib/src/libtomcrypt/src/pk/pkcs1/pkcs_1_v1_5_decode.c
    stormlib/src/libtomcrypt/src/pk/rsa/rsa_exptmod.c
    stormlib/src/libtomcrypt/src/pk/rsa/rsa_free.c
    stormlib/src/libtomcrypt/src/pk/rsa/rsa_import.c
    stormlib/src/libtomcrypt/src/pk/rsa/rsa_make_key.c
    stormlib/src/libtomcrypt/src/pk/rsa/rsa_verify_hash.c
    stormlib/src/libtomcrypt/src/pk/rsa/rsa_verify_simple.c
    stormlib/src/libtommath/bncore.c
    stormlib/src/libtommath/bn_fast_mp_invmod.c
    stormlib/src/libtommath/bn_fast_mp_montgomery_reduce.c
    stormlib/src/libtommath/bn_fast_s_mp_mul_digs.c
    stormlib/src/libtommath/bn_fast_s_mp_mul_high_digs.c
    stormlib/src/libtommath/bn_fast_s_mp_sqr.c
    stormlib/src/libtommath/bn_mp_2expt.c
    stormlib/src/libtommath/bn_mp_abs.c
    stormlib/src/libtommath/bn_mp_add.c
    stormlib/src/libtommath/bn_mp_addmod.c
    stormlib/src/libtommath/bn_mp_add_d.c
    stormlib/src/libtommath/bn_mp_and.c
    stormlib/src/libtommath/bn_mp_clamp.c
    stormlib/src/libtommath/bn_mp_clear.c
    stormlib/src/libtommath/bn_mp_clear_multi.c
    stormlib/src/libtommath/bn_mp_cmp.c
    stormlib/src/libtommath/bn_mp_cmp_d.c
    stormlib/src/libtommath/bn_mp_cmp_mag.c
    stormlib/src/libtommath/bn_mp_cnt_lsb.c
    stormlib/src/libtommath/bn_mp_copy.c
    stormlib/src/libtommath/bn_mp_count_bits.c
    stormlib/src/libtommath/bn_mp_div.c
    stormlib/src/libtommath/bn_mp_div_2.c
    stormlib/src/libtommath/bn_mp_div_2d.c
    stormlib/src/libtommath/bn_mp_div_3.c
    stormlib/src/libtommath/bn_mp_div_d.c
    stormlib/src/libtommath/bn_mp_dr_is_modulus.c
    stormlib/src/libtommath/bn_mp_dr_reduce.c
    stormlib/src/libtommath/bn_mp_dr_setup.c
    stormlib/src/libtommath/bn_mp_exch.c
    stormlib/src/libtommath/bn_mp_exptmod.c
    stormlib/src/libtommath/bn_mp_exptmod_fast.c
    stormlib/src/libtommath/bn_mp_expt_d.c
    stormlib/src/libtommath/bn_mp_exteuclid.c
    stormlib/src/libtommath/bn_mp_fread.c
    stormlib/src/libtommath/bn_mp_fwrite.c
    stormlib/src/libtommath/bn_mp_gcd.c
    stormlib/src/libtommath/bn_mp_get_int.c
    stormlib/src/libtommath/bn_mp_grow.c
    stormlib/src/libtommath/bn_mp_init.c
    stormlib/src/libtommath/bn_mp_init_copy.c
    stormlib/src/libtommath/bn_mp_init_multi.c
    stormlib/src/libtommath/bn_mp_init_set.c
    stormlib/src/libtommath/bn_mp_init_set_int.c
    stormlib/src/libtommath/bn_mp_init_size.c
    stormlib/src/libtommath/bn_mp_invmod.c
    stormlib/src/libtommath/bn_mp_invmod_slow.c
    stormlib/src/libtommath/bn_mp_is_square.c
    stormlib/src/libtommath/bn_mp_jacobi.c
    stormlib/src/libtommath/bn_mp_karatsuba_mul.c
    stormlib/src/libtommath/bn_mp_karatsuba_sqr.c
    stormlib/src/libtommath/bn_mp_lcm.c
    stormlib/src/libtommath/bn_mp_lshd.c
    stormlib/src/libtommath/bn_mp_mod.c
    stormlib/src/libtommath/bn_mp_mod_2d.c
    stormlib/src/libtommath/bn_mp_mod_d.c
    stormlib/src/libtommath/bn_mp_montgomery_calc_normalization.c
    stormlib/src/libtommath/bn_mp_montgomery_reduce.c
    stormlib/src/libtommath/bn_mp_montgomery_setup.c
    stormlib/src/libtommath/bn_mp_mul.c
    stormlib/src/libtommath/bn_mp_mulmod.c
    stormlib/src/libtommath/bn_mp_mul_2.c
    stormlib/src/libtommath/bn_mp_mul_2d.c
    stormlib/src/libtommath/bn_mp_mul_d.c
    stormlib/src/libtommath/bn_mp_neg.c
    stormlib/src/libtommath/bn_mp_n_root.c
    stormlib/src/libtommath/bn_mp_or.c
    stormlib/src/libtommath/bn_mp_prime_fermat.c
    stormlib/src/libtommath/bn_mp_prime_is_divisible.c
    stormlib/src/libtommath/bn_mp_prime_is_prime.c
    stormlib/src/libtommath/bn_mp_prime_miller_rabin.c
    stormlib/src/libtommath/bn_mp_prime_next_prime.c
    stormlib/src/libtommath/bn_mp_prime_rabin_miller_trials.c
    stormlib/src/libtommath/bn_mp_prime_random_ex.c
    stormlib/src/libtommath/bn_mp_radix_size.c
    stormlib/src/libtommath/bn_mp_radix_smap.c
    stormlib/src/libtommath/bn_mp_rand.c
    stormlib/src/libtommath/bn_mp_read_radix.c
    stormlib/src/libtommath/bn_mp_read_signed_bin.c
    stormlib/src/libtommath/bn_mp_read_unsigned_bin.c
    stormlib/src/libtommath/bn_mp_reduce.c
    stormlib/src/libtommath/bn_mp_reduce_2k.c
    stormlib/src/libtommath/bn_mp_reduce_2k_l.c
    stormlib/src/libtommath/bn_mp_reduce_2k_setup.c
    stormlib/src/libtommath/bn_mp_reduce_2k_setup_l.c
    stormlib/src/libtommath/bn_mp_reduce_is_2k.c
    stormlib/src/libtommath/bn_mp_reduce_is_2k_l.c
    stormlib/src/libtommath/bn_mp_reduce_setup.c
    stormlib/src/libtommath/bn_mp_rshd.c
    stormlib/src/libtommath/bn_mp_set.c
    stormlib/src/libtommath/bn_mp_set_int.c
    stormlib/src/libtommath/bn_mp_shrink.c
    stormlib/src/libtommath/bn_mp_signed_bin_size.c
    stormlib/src/libtommath/bn_mp_sqr.c
    stormlib/src/libtommath/bn_mp_sqrmod.c
    stormlib/src/libtommath/bn_mp_sqrt.c
    stormlib/src/libtommath/bn_mp_sub.c
    stormlib/src/libtommath/bn_mp_submod.c
    stormlib/src/libtommath/bn_mp_sub_d.c
    stormlib/src/libtommath/bn_mp_toom_mul.c
    stormlib/src/libtommath/bn_mp_toom_sqr.c
    stormlib/src/libtommath/bn_mp_toradix.c
    stormlib/src/libtommath/bn_mp_toradix_n.c
    stormlib/src/libtommath/bn_mp_to_signed_bin.c
    stormlib/src/libtommath/bn_mp_to_signed_bin_n.c
    stormlib/src/libtommath/bn_mp_to_unsigned_bin.c
    stormlib/src/libtommath/bn_mp_to_unsigned_bin_n.c
    stormlib/src/libtommath/bn_mp_unsigned_bin_size.c
    stormlib/src/libtommath/bn_mp_xor.c
    stormlib/src/libtommath/bn_mp_zero.c
    stormlib/src/libtommath/bn_prime_tab.c
    stormlib/src/libtommath/bn_reverse.c
    stormlib/src/libtommath/bn_s_mp_add.c
    stormlib/src/libtommath/bn_s_mp_exptmod.c
    stormlib/src/libtommath/bn_s_mp_mul_digs.c
    stormlib/src/libtommath/bn_s_mp_mul_high_digs.c
    stormlib/src/libtommath/bn_s_mp_sqr.c
    stormlib/src/libtommath/bn_s_mp_sub.c
    stormlib/src/lzma/C/LzFind.c
    stormlib/src/lzma/C/LzmaDec.c
    stormlib/src/lzma/C/LzmaEnc.c
    stormlib/src/pklib/crc32.c
    stormlib/src/pklib/explode.c
    stormlib/src/pklib/implode.c
    stormlib/src/jenkins/lookup3.c
)

set(MPQ_SOURCES
    libmpq/common.cpp
    libmpq/explode.cpp
    libmpq/extract.cpp
    libmpq/huffman.cpp
    libmpq/mpq.cpp
    libmpq/wave.cpp
)

set(CXIMAGE_SOURCES
    CxImage/tif_xfile.cpp
    CxImage/ximabmp.cpp
    CxImage/ximadsp.cpp
    CxImage/ximaenc.cpp
    CxImage/ximaexif.cpp
    CxImage/ximage.cpp
    CxImage/ximagif.cpp
    CxImage/ximahist.cpp
    CxImage/ximaico.cpp
    CxImage/ximainfo.cpp
    CxImage/ximaint.cpp
    CxImage/ximajas.cpp
    CxImage/ximajbg.cpp
    CxImage/ximajpg.cpp
    CxImage/ximalpha.cpp
    CxImage/ximalyr.cpp
    CxImage/ximamng.cpp
    CxImage/ximapal.cpp
    CxImage/ximapcx.cpp
    CxImage/ximapng.cpp
    CxImage/ximaraw.cpp
    CxImage/ximasel.cpp
    CxImage/ximaska.cpp
    CxImage/ximatga.cpp
    CxImage/ximath.cpp
    CxImage/ximatif.cpp
    CxImage/ximatran.cpp
    CxImage/ximawbmp.cpp
    CxImage/ximawmf.cpp
    CxImage/ximawnd.cpp
    CxImage/xmemfile.cpp
)
