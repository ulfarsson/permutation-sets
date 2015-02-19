load("../permutation-sets/properties/tableaux.sage")

'''
This file contains permutation sets related to the tableau of permutations
under the RSK-correspondence

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
Example 1: No (2,2)

---
Example 2: No (3,2)

---
Example 3: No (3,3)

---
'''

def get_example(ex):

    if ex == 1:
        print "No (2,2)-shape in the tableau"
        prop = lambda x : not tableau_contains_shape(x.left_tableau(), [2,2])
        return prop, 0


    elif ex == 2:
        print "No (3,2)-shape in the tableau"
        prop = lambda x : not tableau_contains_shape(x.left_tableau(), [3,2])
        return prop, 0

    elif ex == 3:
        print "No (3,3)-shape in the tableau"
        prop = lambda x : not tableau_contains_shape(x.left_tableau(), [3,3])
        return prop, 0

    else:
        return lambda x : False, -1
