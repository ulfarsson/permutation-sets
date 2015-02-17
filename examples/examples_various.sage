load("../pattern-avoidance/mesh_patterns.sage")
load("../permutation-sets/properties/various.sage")

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
Example 1: Simple permutations

---
Example 2: Clumped permutations (maximum number of clumps <= 3 - can be changed)

---
Example 3: Simsun permutations

---
Example 4: Balanced permutations

---
Example 5: Menage permutations

---
Example 6: Kendall-Mann permutations

---
Example 7: Number of recoils <= 1

---
Example 8: Number of saliances (right-to-left minima) <= 1

---
Example 9: Swapping number <= 1

---
Example 10: Swapping number <= 2

---
Example 11: Number of inversions = number of descents

---
'''

if ex == 1:
    print "Simple permutations"
    prop = lambda x : is_simple(x)

if ex == 2:
    print "Clumped permutations (maximum number of clumps <= 3 - can be changed)"
    prop = lambda x : max_number_of_clumps(x) <= 3

if ex == 3:
    print "Simsun permutations"
    prop = lambda x : avoids_mpat(x, ([3,2,1], [(1,0), (1,1), (1,2), (2,0), (2,1), (2,2)]))

if ex == 4:
    print "Balanced permutations"
    prop = lambda x : is_balanced(x)

if ex == 5:
    print "Menage permutations"
    prop = lambda x : is_menage(x)

if ex == 6:
    print "Kendall-Mann permutations"
    prop = lambda x : is_Kendall_Mann(x)

if ex == 7:
    print "Number of recoils <= 1"
    prop = lambda x : x.number_of_recoils() <= 1

if ex == 8:
    print "Number of saliances (right-to-left minima) <= 1"
    prop = lambda x : x.number_of_saliances() <= 1

if ex == 9:
    print "swapping number <= 1"
    prop = lambda x : swapping_number(x) <= 1

if ex == 10:
    print "swapping number <= 2"
    prop = lambda x : swapping_number(x) <= 2

if ex == 11:
    print "number of inversions = number of descents"
    prop = lambda x : x.number_of_descents() == x.number_of_inversions()

if ex == 12:
    print "Fair permutations"
    prop = lambda x : is_fair(x)
