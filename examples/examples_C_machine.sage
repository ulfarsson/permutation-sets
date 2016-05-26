# load("../pattern-avoidance/mesh_patterns.sage")
# load("../permutation-sets/properties/various.sage")
load("../permutation-sets/properties/C_machine.sage")

'''
This file contains various permutation sets

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
Example 1: First test

---
Example 2: Description

---
'''

def get_example(ex):

    if ex == 1:
        print "C-machine returns second largest"
        return ps, 2

    # elif ex == 2:
    #     print "C-machine returns smallest element"
    #     prop = lambda x : max_number_of_clumps(x) <= 3
    #     return prop, 0

    else:
        return lambda x : False, -1
