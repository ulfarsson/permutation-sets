'''
--------------------------------------------------------------------------------
First we have functions that create dictionaries based on a True or False
property that is used to identify the permutations
--------------------------------------------------------------------------------
'''

def perms_sat_prop(N, prop):
    '''
    Create a dictionary, D, containing keys 1, 2, 3, ..., N. Each key points to
    a list of permutations satisfying the property prop
    '''

    D = {}

    for n in range(1, N+1):

        D[n] = filter(prop, Permutations(n))

    return D

def perms_sat_prop_w_complement(N, prop):
    '''
    Create a dictionary, D, containing keys 1, 2, 3, ..., N. Each key points to
    a list of permutations satisfying the property prop. The dictionary E has
    the same keys and they point to the complement.
    '''

    D, E = {}, {}

    for n in range(1, N+1):

        Dn, En = [], []

        for perm in Permutations(n):
            if prop(perm):
                Dn.append(perm)
            else:
                En.append(perm)

        D[n], E[n] = Dn, En


    return D, E

def perms_sat_prop_w_complement_different_sizes(Ng, Nb, prop, verb = False):
    '''
    Create a dictionary, D, containing keys 1, 2, 3, ..., Ng. Each key points to
    a list of permutations satisfying the property prop.

    Create a dictionary, E, containing keys 1, 2, 3, ..., Nb. Each key points to
    a list of permutations NOT satisfying the property prop.
    '''

    D, E = {}, {}

    # Putting into both dictionaries
    for n in range(1, min(Ng, Nb)+1):

        Dn, En = [], []

        for perm in Permutations(n):
            if prop(perm):
                Dn.append(perm)
            else:
                En.append(perm)

        D[n], E[n] = Dn, En

        if verb:
            print 'Done with length %s' %n

    # Note that only one of the for-loops below will be non-empty

    # Filling in the rest of D
    for n in range(Nb+1, Ng+1):

        Dn = []

        for perm in Permutations(n):
            if prop(perm):
                Dn.append(perm)

        D[n] = Dn

        if verb:
            print 'Done with length %s' %n

    # Filling in the rest of E
    for n in range(Ng+1, Nb+1):

        En = []

        for perm in Permutations(n):
            if not prop(perm):
                En.append(perm)

        E[n] = En
        if verb:
            print 'Done with length %s' %n


    return D, E

'''
--------------------------------------------------------------------------------
Next we have functions that create dictionaries based on an image of a map
Sn -> Sn
--------------------------------------------------------------------------------
'''

def perms_in_image(Ng, func, verb = report):

    D, E = {}, {}

    for n in range(1, Ng+1):
        Dn, En = [], []
        L = sorted(list(Set(map(lambda x : Permutation(func(x)).rank(), Permutations(n)))))
        s = 0
        for ell in L:
            Dn.append(Permutations(n)[ell])
            En + [Permutations(n)[i] for i in range(s,ell)]
        D[n], E[n] = Dn, En

        if verb:
            print 'Done with length %s' %n

    return D, E

def perms_in_image_different_sizes(Ng, Nb, func, verb = report):

    D, E = {}, {}

    # Putting into both dictionaries
    for n in range(1, min(Ng, Nb)+1):
        Dn, En = [], []
        L = sorted(list(Set(map(lambda x : Permutation(func(x)).rank(), Permutations(n)))))
        s = 0
        for ell in L:
            Dn.append(Permutations(n)[ell])
            En + [Permutations(n)[i] for i in range(s,ell)]
        D[n], E[n] = Dn, En

        if verb:
            print 'Done with length %s' %n

    # Note that only one of the for-loops below will be non-empty

    # Filling in the rest of D
    for n in range(Nb+1, Ng+1):

        D[n] = list(Set(map(lambda x : Permutation(func(x)), Permutations(n))))

        if verb:
            print 'Done with length %s' %n

    # Filling in the rest of E
    for n in range(Ng+1, Nb+1):

        En = []
        L = sorted(list(Set(map(lambda x : Permutation(func(x)).rank(), Permutations(n)))))
        s = 0
        for ell in L:
            En + [Permutations(n)[i] for i in range(s,ell)]
        E[n] = En

        if verb:
            print 'Done with length %s' %n

    return D, E