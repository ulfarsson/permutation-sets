load("../pattern-avoidance/classical_patterns.sage")
load("../permutation-sets/properties/sorting.sage")

'''
This file contains permutation sets related to sorting operators

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
Example 1: 1-stack-sortables

---
Example 2: West-2-stack-sortables

---
Example 3: West-3-stack-sortables

---
Example 4: B^{-1}(Av(1243))

---
Example 5: Bubble-sorted permutations

---
Example 6: Stack-sorted permutations

---
'''

if ex == 1:
    print "1-stack-sortables"
    prop = lambda x : is_sorted(stack_sort(x))

if ex == 2:
    print "West-2-stack-sortables"
    prop = lambda x : is_sorted(stack_sort(stack_sort(x)))

if ex == 3:
    print "West-3-stack-sortables"
    prop = lambda x : is_sorted(stack_sort(stack_sort(stack_sort(x))))

if ex == 4:
    print "B^{-1}(Av(1243))"
    prop = lambda x : avoids_clpatt(bubble_sort(x), [1,2,4,3])

if ex == 5:
    print "Bubble-sorted permutations"
    no_prop    = True
    calc_image = True
    func = bubble_sort

if ex == 6:
    print "Stack-sorted permutations"
    no_prop    = True
    calc_image = True
    func = stack_sort
