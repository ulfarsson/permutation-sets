def perms_sat_prop(N, prop):
    '''
    Create a dictionary, D, containing keys 1, 2, 3, ..., N. Each key points to
    a list of permutations satisfying the property prop
    '''

    D = dict()

    for n in range(1, N+1):

        D[n] = filter(prop, Permutations(n))

    return D

def perms_sat_prop_w_complement(N, prop):
    '''
    Create a dictionary, D, containing keys 1, 2, 3, ..., N. Each key points to
    a list of permutations satisfying the property prop. The dictionary E has
    the same keys and they point to the complement.
    '''

    D = dict()
    E = dict()

    for n in range(1, N+1):

        Dn = []
        En = []

        for perm in Permutations(n):
            if prop(perm):
                Dn.append(perm)
            else:
                En.append(perm)

        D[n] = Dn
        E[n] = En


    return D, E