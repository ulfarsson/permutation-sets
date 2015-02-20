def is_PDD(perm):
	n = len(perm)

	if n <= 1:
		return True

	return Set( [ perm[i+1]-perm[i] for i in range(n-1) ] ).cardinality() == n-1

def PDDs(n):

	return [ perm for perm in Permutations(n) if is_PDD(perm) ]

def numPDDs(n):

	return sum( [ 1 for perm in Permutations(n) if is_PDD(perm) ] )

def is_PDD_r(perm,r):

	n = len(perm)

	if n <= r:
		return True

	return Set( [ perm[i+r]-perm[i] for i in range(n-r) ] ).cardinality() == n-r

def PDD_rs(n,r):

	return [ perm for perm in Permutations(n) if is_PDD_r(perm,r) ]

def numPDD_rs(n):

	return sum( [ 1 for perm in Permutations(n) if is_PDD_r(perm,r) ] )

def is_Costa(perm):

	n = len(perm)

	return all( [ is_PDD_r(perm,r) for r in range(1,n) ])

def Costas(n):

	return [ perm for perm in Permutations(n) if is_Costa(perm) ]

def numCostas(n):

	return sum( [ 1 for perm in Permutations(n) if is_Costa(perm) ] )

def brute_force_primitive_roots(n):

	for f in Integers(n):
		if gcd(f,n) != 1: continue
		if f.multiplicative_order() == n-1: yield f