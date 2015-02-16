def enum_perms(D):
    '''
    Return the number of permutations of each length in the dictionary D
    '''
    for k in D.keys():
        print 'Permutations of length %s with this property are %s' %(k, len(D[k]))