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

# These variables should not be changed manually
no_prop    = False
calc_image = False

if ex == 1:
    print "Involutions (order <= 2)"
    no_prop     = True
    perms_exist = True

    def func(n):
        return map(lambda T : robinson_schensted_knuth_inverse(T,T, 'permutation'), StandardTableaux(n))

if ex == 2:
    print "No 2 in the cycle type"
    prop = lambda x : not 2 in x.cycle_type()

if ex == 3:
    print "Single cycles"
    prop = lambda x : len(x.cycle_type()) == 1

if ex == 4:
    print "Dihedral group"
    no_prop     = True
    perms_exist = True

    def func(n):
        if n == 0:
            return Permutations(0)
        if n == 1:
            return Permutations(1)
        if n == 2:
            return Permutations(2)

        return map(Permutation, DihedralGroup(n))

if ex == 5:
    print "Alternating group"
    no_prop     = True
    perms_exist = True

    def func(n):
        return map(Permutation, AlternatingGroup(n))
