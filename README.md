# Spring '23 CS 378 PfCP Microkernel

## 14th February, 2023 ##

### Change remote repository ###
The ownership of this repository has changed from dnparikh to utcs378-pfcp. 

To update your remote repository to the new repository, run the following command:

`git remote set-url origin git@github.com:utcs378-pfcp/microkernel.git` 

To make sure the changes took effect run 

`git remote -v`

### Building towards a microkernel ###

Things you will need:

* Intrinsics header: immintrin.h
* Datatype for registers: `__m256d`
* Load instruction      : `_mm256_loadu_pd`
* Store instruction     : `_mm256_storeu_pd`
* Broadcast instruction : `_mm256_broadcast_sd`
* FMA instruction       : `_mm256_fmadd_pd`

Understanding the intrinsics:

| | Explanation |
| :---        |    :----  |   
| `256`  | number of bits in the register |
| `u` | unalinged load/store |
| `pd` | packed doubles |
| `sd` | single double |

Further reference for intrinsics: https://www.intel.com/content/www/us/en/docs/intrinsics-guide/index.html#techs=AVX_ALL&ig_expand=628

