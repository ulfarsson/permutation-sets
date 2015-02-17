load("../permutation-sets/create_dict.sage")
load("../permutation-sets/dict_properties.sage")
load("../pattern-avoidance/mesh_patterns.sage")

'''
This file contains permutation sets defined in terms of avoidance of mesh
patterns.

ex     : Example number
Ng     : The largest permutations that satisfy the property
Nb     : The largest permutations that do not satisfy the property
report : Set to True to get status messages
cpus   : The number of cores to use
         Set to 0 if you want Sage to determine the number of available cores
         Set to 1 if you want to call the single core version
'''

ex     = 1
Ng     = 6
Nb     = 4
report = True
cpus   = 1 # NOTHING ELSE IMPLEMENTED

# ------------------------------------------------------------------------------
'''
Example 1
Avoiders of (123,{(0,0),(1,1),(2,2),(3,3)}) and (123,{(0,3),(1,2),(2,1),(3,0)})

---

Example 2
"Avoiders of (12,{(0,0),(1,1),(2,2)}) and (12,{(0,2),(1,1),(2,0)})"

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

'''
At this point a specific example has been chosen and prop has been given the
corresponding function. We now create the dictionaries
'''

if cpus == 1:
    A, B = perms_sat_prop_w_complement_different_sizes(Ng, Nb, prop, verb = report)
else:
    print 'Parallel version has not been implemented'

enum_perms(A)