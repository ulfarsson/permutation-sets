'''
This file contains permutation sets related to fixed points

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
Example 1: == 0

---
Example 2: <= 1

---
Example 3: <= 2

---
Example 4: <= 3

---
'''
def get_example(ex):

    if ex == 1:
        print "Nr. of fixed points == 0"
        prop = lambda x : x.number_of_fixed_points() == 0
        return prop, 0

    elif ex == 2:
        print "Nr. of fixed points <= 1"
        prop = lambda x : x.number_of_fixed_points() <= 1
        return prop, 0

    elif ex == 3:
        print "Nr. of fixed points <= 2"
        prop = lambda x : x.number_of_fixed_points() <= 2
        return prop, 0

    elif ex == 4:
        print "Nr. of fixed points <= 3"
        prop = lambda x : x.number_of_fixed_points() <= 3
        return prop, 0

    else:
        return lambda x : False, -1
