load("create_dict.sage")
load("../pattern-avoidance/mesh_patterns.sage")

'''
This file contains permutation sets defined in terms of avoidance of mesh
patterns.
'''

'''
Example 1
Avoiders of (123,{(0,0),(1,1),(2,2),(3,3)}) and (123,{(0,3),(1,2),(2,1),(3,0)})

---

Example 2
"Avoiders of (12,{(0,0),(1,1),(2,2)}) and (12,{(0,2),(1,1),(2,0)})"

---
'''

# Change this to run a specific example
ex  = 1
Ng  = 5
Nb  = 4
log = False

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

D, E = perms_sat_prop_w_complement_different_sizes(Ng, Nb, prop, verb = log)