

load("../pattern-avoidance/mesh_patterns.sage")
load("../permutation-sets/properties/various.sage")
load("../permutation-sets/properties/Costa.sage")

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

Example 12: Fair permutations

---

Example 13: PDD permutations

---

Example 15: Costa permutations

---
'''

def get_example(ex):

    if ex == 1:
        print "Simple permutations"
        prop = lambda x : is_simple(x)
        return prop, 0

    elif ex == 2:
        print "Clumped permutations (maximum number of clumps <= 3 - can be changed)"
        prop = lambda x : max_number_of_clumps(x) <= 3
        return prop, 0

    elif ex == 3:
        print "Simsun permutations"
        prop = lambda x : avoids_mpat(x, ([3,2,1], [(1,0), (1,1), (1,2), (2,0), (2,1), (2,2)]))
        return prop, 0

    elif ex == 4:
        print "Balanced permutations"
        prop = lambda x : is_balanced(x)
        return prop, 0

    elif ex == 5:
        print "Menage permutations"
        prop = lambda x : is_menage(x)
        return prop, 0

    elif ex == 6:
        print "Kendall-Mann permutations"
        prop = lambda x : is_Kendall_Mann(x)
        return prop, 0

    elif ex == 7:
        print "Number of recoils <= 1"
        prop = lambda x : x.number_of_recoils() <= 1
        return prop, 0

    elif ex == 8:
        print "Number of saliances (right-to-left minima) <= 1"
        prop = lambda x : x.number_of_saliances() <= 1
        return prop, 0

    elif ex == 9:
        print "swapping number <= 1"
        prop = lambda x : swapping_number(x) <= 1
        return prop, 0

    elif ex == 10:
        print "swapping number <= 2"
        prop = lambda x : swapping_number(x) <= 2
        return prop, 0

    elif ex == 11:
        print "number of inversions = number of descents"
        prop = lambda x : x.number_of_descents() == x.number_of_inversions()
        return prop, 0

    elif ex == 12:
        print "Fair permutations"
        prop = lambda x : is_fair(x)
        return prop, 0

    elif ex == 13:
        print "PDD permutations"
        prop = lambda x : is_PDD(x)
        return prop, 0

    elif ex == 14:
        print "Costa permutations"
        prop = lambda x : is_Costa(x)
        return prop, 0

    elif ex == 15:
        print "Median permutations"

        def gen_median(n):
            first_el = n//2 + 1
            perm = [first_el]
            curr = first_el
            if n%2 == 0:
                mult = -1
            else:
                mult = 1

            for i in range(1, n):
                curr = curr + mult*i
                perm.append(curr)
                mult = -mult

            return Permutation(perm)


        def is_median(x): return x == gen_median(len(x))


        prop = lambda x : is_median(x)
        return prop, 0

    else:
        return lambda x : False, -1
