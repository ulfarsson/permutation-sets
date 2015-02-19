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
Example 1: Involutions (order <= 2)

---
Example 2: No 2 in the cycle type

---
Example 3: Single cycles

---
Example 4: The dihedral group

---
Example 5: The alternating group

---
'''

def get_example(ex):

    if ex == 1:
        print "Involutions (order <= 2)"

        def tmp(x):
            tab = RSK(x)
            return tab[0] == tab[1]

        prop = tmp
        return prop, 0

        # def func(n):
        #     return map(lambda T : robinson_schensted_knuth_inverse(T,T, 'permutation'), StandardTableaux(n))
        # return func, 2

    elif ex == 2:
        print "No 2 in the cycle type"
        prop = lambda x : not 2 in x.cycle_type()
        return prop, 0

    elif ex == 3:
        print "Single cycles"
        prop = lambda x : len(x.cycle_type()) == 1
        return prop, 0

    elif ex == 4:
        print "Dihedral group"

        def func(n):
            if n == 0:
                return Permutations(0)
            if n == 1:
                return Permutations(1)
            if n == 2:
                return Permutations(2)

            return map(Permutation, DihedralGroup(n))
        return func, 2

    elif ex == 5:
        print "Alternating group"

        def func(n):
            return map(Permutation, AlternatingGroup(n))

        return func, 2

    else:
        return lambda x : False, -1
