load("../pattern-avoidance/classical_patterns.sage")
load("../pattern-avoidance/mesh_patterns.sage")
load("../permutation-sets/properties/Schubert.sage")

'''
This file contains permutation sets defined in terms of Schubert varieties

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

Smooth Schubert varieties
---

Example 2

Factorial Schubert varieties
---

Example 3

Gorenstein Schubert varieties
---
'''

if ex == 1:

    prop = lambda x : avoids_clpatt(x, [1,3,2,4]) and avoids_clpatt(x, [2,1,4,3])

if ex == 2:

    prop = lambda x : avoids_clpatt(x, [1,3,2,4]) and avoids_mpat(x, ([2,1,4,3], [(2,2)]))

if ex == 3:

    prop = lambda x : is_Gorenstein(x)
