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

        print "Increasing permutations, f(n) = {1}"

        def f(n) : return [1]

        def func(n):
            return FPerm(f).perms(n)

        return func, 2

    elif ex == 2:
        print "Wedges >, f(n) = {1,n}"

        def f(n) : return [1,n]

        def func(n):
            return FPerm(f).perms(n)

        return func, 2

    elif ex == 3:
        print "Median permutations, f(n) = stuff"

        def f(n) : return range((n+1)/2, (n+4)/2)

        def func(n):
            return FPerm(f).perms(n)

        return func, 2

    elif ex == 4:
        print "Median permutations, f(n) = stuff"

        def f(n): return [(n+2)//3]

        def func(n):
            return FPerm(f).perms(n)

        return func, 2

    elif ex == 5:
        print "Wedges < that end with n"
        prop = lambda x : x[-1] == len(x) and avoids_clpatt(x,[3,1,2]) and avoids_clpatt(x,[1,3,2])
        return prop, 0

    elif ex == 6:
        print "Trivian permutations, f(n) = stuff"

        def f1(n): return [(n+2)//3]
        def f2(n):
            if n <= 2: return [1]
            return [(n+1)//3]
        def f3(n):
            if n <= 2: return [1]
            return [n//3]

        def func(n):
            return FPerm(f1).perms(n) + FPerm(f2).perms(n) + FPerm(f3).perms(n)

        return func, 2

    elif ex == 7:
        print "First or thirds"

        def f(n):
            if n <=2:
                return range(1,n+1)

            return [1,3]

        def func(n):
            return FPerm(f).perms(n)

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
