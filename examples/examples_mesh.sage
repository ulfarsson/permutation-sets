load("../pattern-avoidance/mesh_patterns.sage")

'''
This file contains permutation sets defined in terms of avoidance of mesh
patterns.

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

if ex == 1:

    mp1 = ([1,2,3],[(0,0),(1,1),(2,2),(3,3)])
    mp2 = ([1,2,3],[(0,3),(1,2),(2,1),(3,0)])

    prop = lambda x : avoids_mpats(x,[mp1,mp2])

if ex == 2:

    mp1 = ([1,2],[(0,0),(1,1),(2,2)])
    mp2 = ([1,2],[(0,2),(1,1),(2,0)])

    prop = lambda x : avoids_mpats(x,[mp1,mp2])
