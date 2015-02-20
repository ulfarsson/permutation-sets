'''
This file contains the meanders as well as related sets

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
Example 1: Meanders

---
'''

def get_example(ex):

    if ex == 1:
        print "Meanders"
        prop = 'meanders'
        return prop, 3

    else:
        return lambda x : False, -1
