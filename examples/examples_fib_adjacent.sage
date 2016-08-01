
'''
Permutations where adjacent elements' sums are Fibonacci numbers

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
Example 1
---
Example 2
---
'''

def __fibcheck(p, cyclic):
    fibs = list(fibonacci_xrange(1, len(p)**2))[1:]
    for i in xrange(len(p) - 1):
        if p[i] + p[i+1] not in fibs:
           return False
    if cyclic:
        if p[0] + p[-1] not in fibs:
            return False
    return True

def get_example(ex):

    if ex == 1:
        return lambda p: __fibcheck(p, False), 0

    elif ex == 2:
        return lambda p: __fibcheck(p, True), 0
        
    else:
        return lambda x : False, -1
