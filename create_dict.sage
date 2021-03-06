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
Next we have functions that create dictionaries D and E based on an image of a
map Sn -> Sn. The value of key n in D is the list of permutations of length n
in the image of Sn. Similarly, the value of key n in E is the list of
permutations of length n NOT in the image of Sn.
--------------------------------------------------------------------------------
'''

def perms_in_image(Ng, func, verb=False):

    D, E = {}, {}

    for n in range(1, Ng+1):
        L = sorted(list(Set(map(lambda x : Permutation(func(x)).rank(), Permutations(n)))))
        D[n] = [Permutations(n)[ell] for ell in L]
        E[n] = [Permutations(n)[ell] for ell in range(factorial(n)) if ell not in L]

        if verb:
            print 'Done with length %s' %n

    return D, E

def perms_in_image_different_sizes(Ng, Nb, func, verb=False):

    N_low, N_high = min(Ng, Nb), max(Ng, Nb)

    D, E = perms_in_image(N_low, func, verb=verb)

    if N_low == N_high:
        return D, E

    # Filling in the rest of D or E
    for n in range(N_low + 1, N_high+1):
        L = sorted(list(Set(map(lambda x : Permutation(func(x)).rank(), Permutations(n)))))

        if Ng > Nb:
            D[n] = [Permutations(n)[ell] for ell in L]
        elif Ng < Nb:
            E[n] = [Permutations(n)[ell] for ell in range(factorial(n)) if ell not in L]

        if verb:
            print 'Done with length %s' %n

    return D, E

'''
--------------------------------------------------------------------------------
Next we have functions that create dictionaries based on an already existing
(or easily created) set of permutations
--------------------------------------------------------------------------------
'''

def perms_to_dicts(Ng, func, verb=False):

    D, E = {}, {}

    for n in range(1, Ng+1):
        Dn, En = func(n), []
        L = sorted(map(lambda x : x.rank(), Dn))

        s = 0
        for ell in L+[factorial(n)]:
            En.extend([Permutations(n)[i] for i in range(s,ell)])
            s = ell+1
        D[n], E[n] = Dn, En

        if verb:
            print 'Done with length %s' %n

    return D, E

def perms_to_dicts_different_sizes(Ng, Nb, func, verb=False):

    D, E = {}, {}

    # Putting into both dictionaries
    for n in range(1, min(Ng, Nb)+1):
        Dn, En = func(n), []
        L = sorted(map(lambda x : x.rank(), Dn))

        s = 0
        for ell in L+[factorial(n)]:
            En.extend([Permutations(n)[i] for i in range(s,ell)])
            s = ell+1
        D[n], E[n] = Dn, En

        if verb:
            print 'Done with length %s' %n

    # Note that only one of the for-loops below will be non-empty

    # Filling in the rest of D
    for n in range(Nb+1, Ng+1):

        D[n] = func(n)

        if verb:
            print 'Done with length %s' %n

    # Filling in the rest of E
    for n in range(Ng+1, Nb+1):

        En = []
        L = sorted(map(lambda x : x.rank(), func(n)))

        s = 0
        for ell in L+[factorial(n)]:
            En.extend([Permutations(n)[i] for i in range(s,ell)])
            s = ell+1
        E[n] = En

        if verb:
            print 'Done with length %s' %n

    return D, E

'''
--------------------------------------------------------------------------------
Next we have functions that create dictionaries based on a precomputed output
--------------------------------------------------------------------------------
'''

def load_precomputed(Ng, Nb, prop, verb=False):

    load('../permutation-sets/examples/precomputed/'+prop+'.sage')

    D, E = {}, {}

    # Putting into both dictionaries
    for n in range(1, min(Ng, Nb)+1):

        Dn, En = eval(prop)[n], []
        L = sorted(map(lambda x : Permutation(x).rank(), Dn))

        s = 0
        for ell in L+[factorial(n)]:
            En.extend([Permutations(n)[i] for i in range(s,ell)])
            s = ell+1
        D[n], E[n] = Dn, En

        if verb:
            print 'Done with length %s' %n

    # # Note that only one of the for-loops below will be non-empty

    # Filling in the rest of D
    for n in range(Nb+1, Ng+1):

        D[n] = eval(prop)[n]

        if verb:
            print 'Done with length %s' %n

    # Filling in the rest of E
    for n in range(Ng+1, Nb+1):

        En = []
        L = sorted(map(lambda x : Permutation(x).rank(), eval(prop)[n]))

        s = 0
        for ell in L+[factorial(n)]:
            En.extend([Permutations(n)[i] for i in range(s,ell)])
            s = ell+1
        E[n] = En

        if verb:
            print 'Done with length %s' %n

    return D, E
