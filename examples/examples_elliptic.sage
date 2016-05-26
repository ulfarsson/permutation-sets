
# load("../pattern-avoidance/mesh_patterns.sage")
# load("../permutation-sets/properties/various.sage")
load("../permutation-sets/properties/elliptic_permutations.sage")

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
Example 1: Elliptic Curve y^2 = x^3 + x over Finite Field of size 1889

p1 = [[3,1,2], [(0,1), (2,3)]]
p2 = [[1,3,2], [(0,2), (2,0)]]
p3 = [[2,1,3,4], [(1,3), (3,1)]]
p4 = [[2,3,1,4], [(0,3), (1,0), (3,2)]]
p5 = [[3,2,4,1], [(0,1), (1,4), (3,2)]]
p6 = [[3,4,2,1], [(1,1), (3,3)]]

---
Example 2: Description

---
'''

def get_example(ex):

    if ex == 1:
        print '''\nExample %s: Finite Field of size 1889\n''' % ex
        F = GF(7919)
        func = lambda n : field_permutations(F, n)
        return func, 2

    elif ex == 2:
        print '''\nExample %s: Iterating 2*x over a finite Field of size 7919\n''' % ex
        F = GF(7919)
        P = lambda x : 2*x
        func = lambda n : field_permutations_poly(F, P, n)
        return func, 2

    elif ex == 3:
        print '''\nExample %s: Lucas over a finite Field of size 163\n''' % ex
        F = GF(163)
        func = lambda n : field_permutations_Lucas(F, n)
        return func, 2

    elif ex == 4:
        print '''\nExample %s: Elliptic Curve defined by y^2 = x^3 + x over Finite Field of size 251\n''' % ex
        k = GF(251)
        E = EllipticCurve(k,[1,0])
        func = lambda n : elliptic_permutations(E, n)
        return func, 2

    elif ex == 5:
        print '''\nExample %s: Elliptic Curve defined by y^2 = x^3 + x over Finite Field of size 1889\n''' % ex
        k = GF(1889)
        E = EllipticCurve(k,[1,0])
        func = lambda n : elliptic_permutations(E, n)
        return func, 2

    elif ex == 6:
        print '''\nExample %s: Elliptic Curve defined by y^2 = x^3 + x over Finite Field of size 7919\n''' % ex
        k = GF(7919)
        E = EllipticCurve(k,[1,0])
        func = lambda n : elliptic_permutations(E, n)
        return func, 2

    elif ex == 7:
        print '''\nExample %s: Elliptic Curve defined by y^2 = x^3 + x + 1 over Finite Field of size 7919\n''' % ex
        k = GF(7919)
        E = EllipticCurve(k,[1,1])
        func = lambda n : elliptic_permutations(E, n)
        return func, 2

    elif ex == 8:
        print '''\nExample %s: Lucas for the elliptic Curve defined by y^2 = x^3 + x over Finite Field of size 23\n''' % ex
        k = GF(23)
        E = EllipticCurve(k,[1,0])
        func = lambda n : elliptic_permutations_Lucas(E, n)
        return func, 2

    else:
        return lambda x : False, -1
