def in_one(v, u, VV):
	'''
	Helper function
	'''
	if v == u:
		return False
	for big_occ in VV:
		if Set(v).issubset(Set(big_occ)) and Set(u).issubset(Set(big_occ)):
			return True
	return False


def occurrence_graph2(w, p, P):
	'''
	Given a permutation w and a pattern p we define a graph G = G(w,p) such that
	the vertices of G are occurrences of the pattern p in w. Two vertices are
	connected by an edge if and only if the corresponding occurrences exist in
	a single occurrence of P.
	'''
	V  = map(tuple, w.pattern_positions(p))
	VV = map(tuple, w.pattern_positions(P))
	return Graph([ V, lambda v, u : in_one(v, u, VV) ])
