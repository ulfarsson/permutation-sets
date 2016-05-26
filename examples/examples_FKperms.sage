load("../pattern-avoidance/classical_patterns.sage")
load("../permutation-sets/properties/Fperms.sage")

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
Example 1: f(n) = {1}

---


---
'''

def get_example(ex):

    if ex == 1:

        print "Decs"

        def decs(k,n):
            if (k > 1): return range(1,k)
            return range(1,n+1)

        def func(n):
            return FKPerm(decs).perms(n)

        return func, 2

    elif ex == 2:
        print "Decs with jump to k-2"

        def decswj(k,n):
            if (k > 1): return range(1,k-1)
            return range(1,n+1)

        def func(n):
            return FKPerm(decswj).perms(n)

        return func, 2


    elif ex == 3:
        print "Decs with jump to k-3"

        def decswj(k,n):
            if (k >= 2): return range(1,k-2)
            return range(1,n+1)

        def func(n):
            return FKPerm(decswj).perms(n)

        return func, 2

    elif ex == 4:
        print "Decs flipped"

        def decswj(k,n):
            if (k >= 2): return [1]+range(k,n+1)
            return range(1,n+1)

        def func(n):
            return FKPerm(decswj).perms(n)

        return func, 2

    elif ex == 5:
        print "Decs flipped and skip"

        def decswj(k,n):
            if (k >= 2): return [1]+range(k+1,n+1)
            return range(1,n+1)

        def func(n):
            return FKPerm(decswj).perms(n)

        return func, 2

    elif ex == 6:
        print "Stay around k"

        def decswj(k,n):
            if k == -1: return range(1,n+1)
            if (k >= 2) and k <= n: return [k-1,k]
            if k == n+1: return [1,n]
            if k == 1: return [1,n]

        def func(n):
            return FKPerm(decswj).perms(n)

        return func, 2

    elif ex == 7:
        print "Stay around k"

        def decswj(k,n):
            if k == -1: return range(1,n+1)
            if (k >= 1) and k < n: return [k,k+1]
            if k == n: return [1,n]
            if k == n+1: return [1,2]

        def func(n):
            return FKPerm(decswj).perms(n)

        return func, 2

    elif ex == 8:
        print "Odds"

        def f(n): return range(1,n+1,2)

        def func(n):
            return FPerm(f).perms(n)

        return func, 2

    elif ex == 9:
        print "Skip 2"

        def f(n): return range(1,2)+range(3,n+1)

        def func(n):
            return FPerm(f).perms(n)

        return func, 2

    elif ex == 10:
        print "Skip 3"

        def f(n):
            if n == 1:
                return [1]

            return range(1,3)+range(4,n+1)

        def func(n):
            return FPerm(f).perms(n)

        return func, 2

    elif ex == 11:
        print "Skip 1 and 3"

        def f(n):
            if n <= 2:
                return range(1,n+1)

            return [2]+range(4,n+1)

        def func(n):
            return FPerm(f).perms(n)

        return func, 2

    elif ex == 12:
        print "Odd: Anything, Even: Minimum"

        def f(n):
            if n % 2 == 0:
                return [1]

            return range(1,n+1)

        def func(n):
            return FPerm(f).perms(n)

        return func, 2

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
