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
Example 4: Involutions satisfying for all i,
    1. either i+1 is in the column immediately on the right of the column of i, or
    2. i+1 is in the first column.
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

    elif ex == 4:

        def bona_condition(t,n):
            for i in range(1,n):
                for L in t:
                    if i+1 in L:
                        ind2 = L.index(i+1)
                        break
                if ind2 == 0:
                    continue
                for L in t:
                    if i in L:
                        ind1 = L.index(i)
                        break
                if ind2 == ind1 + 1:
                    continue
                else:
                    return False

            return True

        def invos_bona_condition(perm):
            tabs = RSK(perm)
            if tabs[0] == tabs[1] and bona_condition(tabs[0],len(perm)):
                return True
            else:
                return False

        print "Involutions satisfying a certain condition"
        prop = lambda x : invos_bona_condition(x)
        return prop, 0

    else:
        return lambda x : False, -1
