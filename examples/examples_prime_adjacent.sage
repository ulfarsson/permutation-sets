'''
This file contains permutation sets defined such that the sums
of adjacent elements are primes.

All inputs defined in the file create_permutation_set.sage
ex     : Example number
Ng     : The largest permutations that satisfy the property
Nb     : The largest permutations that do not satisfy the property
report : Set to True to get status messages
cpus   : The number of cores to use
         Set to 0 if you want Sage to determine the number of available cores
         Set to 1 if you want to call the single core version
'''

# ------------------------------------------------------------------------------
'''
Example 1
Avoiders of (123,{(0,0),(1,1),(2,2),(3,3)}) and (123,{(0,3),(1,2),(2,1),(3,0)})

This is an example of a permutation set for which it is hard for BiSC to
discover a concise description in terms of mesh patterns
---

Example 2
"Avoiders of (12,{(0,0),(1,1),(2,2)}) and (12,{(0,2),(1,1),(2,0)})"

This is an example of a permutation set for which it is hard for BiSC to
discover a concise description in terms of mesh patterns
---
'''


def __adjacent_primes(p, cyclic):

    if len(p) <= 2:
        return True
    else:
        for i in range(len(p) - 1):
            if not is_prime(p[i] + p[i+1]):
                return False
        if cyclic:
            if not is_prime(p[0] + p[-1]):
                return False
        return True

def get_example(ex):

    if ex == 1:
        return lambda p: __adjacent_primes(p, False), 0

    if ex == 2:
        return lambda p: __adjacent_primes(p, True), 0

    else:
        return lambda x : False, -1
