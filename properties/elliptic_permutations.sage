
def field_permutations(F, n):
    '''
    Given a field, F, and an integer n >= 0, we use the points of F to create
    permutations of length n.
    '''

    perms = []
    for p in F:
        if p.order() > n:
            perm = [int(i*p) for i in range(1,n+1)]

            perms.append(Permutation(to_standard(perm)))

    return Set(perms)

x,y = var('x,y')
def Lucas_polys(p,q,k):
    if k == 1: return p
    if k == 2: return q
    return Lucas_polys(p,q,k-1)+Lucas_polys(p,q,k-2)

def field_permutations_Lucas(F, n):
    '''
    Given a field, F, and an integer n >= 0, we use the points of F to create
    permutations of length n.
    '''

    perms = []
    for p in F:
        for q in F:
            pps = [Lucas_polys(p,q,k) for k in range(1,n+1)]
            perm = [int(pp) for pp in pps]
            if Set(perm).cardinality() == n:
                perms.append(Permutation(to_standard(perm)))

    return Set(perms)

def field_permutations_poly(F, P, n):
    '''
    Given a field, F, and an integer n >= 0, we use the points of F to create
    permutations of length n by iterating the polynomial P
    '''

    if n == 1:
        return Set([Permutation([1])])

    perms = []
    for p in F:
        perm = [P(p)]
        for k in range(n-1):
            perm.append(P(perm[-1]))
            if Set(perm).cardinality() == n:
                perm = map(lambda x : int(x)+1, perm)
                perms.append(Permutation(to_standard(perm)))

    return Set(perms)

def elliptic_permutations(E, n):
    '''
    Given an elliptic curve, E, and an integer n >= 0, we use the integral
    points of E to create permutations of length n.
    '''

    perms = []
    for p in E.points():
        if p.order() > n:
            perm = [int((i*p).xy()[0]) for i in range(1,n+1)]

            if Set(perm).cardinality() == n:
                perms.append(Permutation(to_standard(perm)))

    return Set(perms)

def elliptic_permutations_Lucas(E, n):
    '''
    Given an elliptic curve, E, and an integer n >= 0, we use the integral
    points of E to create permutations of length n.
    '''

    perms = []
    for p in E.points():
        for q in E.points():
            pps = [Lucas_polys(p,q,k) for k in range(1,n+1)]
            if all(pp != E(0,1,0) for pp in pps):
                perm = [int(pp.xy()[0]) for pp in pps]
                if Set(perm).cardinality() == n:
                    perms.append(Permutation(to_standard(perm)))

    return Set(perms)
