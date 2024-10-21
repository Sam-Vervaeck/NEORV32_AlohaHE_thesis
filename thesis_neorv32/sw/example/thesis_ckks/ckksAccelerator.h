#ifndef SRC_CKKS_ACCELERATOR_H_
#define SRC_CKKS_ACCELERATOR_H_

#include "neorv32.h"

void ckks_encrypt(const uint32_t* ciphertext, const uint32_t plaintext, const uint32_t poly_size, const uint64_t error_polys_seed,
				  const uint64_t* pk1_seeds, const uint8_t num_moduli, const uint32_t* ntt_modulus_rom_indices,
				  const uint32_t* rns_modulus_rom_indices, const uint32_t* pk0, const int32_t log_scale, const uint32_t* qm,
				  const uint32_t* log_q);
void ckks_decrypt(uint64_t* c0_c1_sk, uint64_t* plaintext, uint32_t poly_size, uint32_t qm, uint8_t log_q,
		          uint8_t ntt_modulus_rom_index, int32_t log_scale);
void ckks_init();

#endif /* SRC_CKKS_ACCELERATOR_H_ */
