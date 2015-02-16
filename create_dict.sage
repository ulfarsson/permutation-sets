def perms_sat_prop(N, prop):
	'''
	Create a dictionary, D, containing keys 1, 2, 3, ..., N. Each key points to
	a list of permutations satisfying the property prop
	'''

    D = dict()

    for n in range(1, N+1):

    	D[n] = filter( prop, Permutations(n))

    return D