def occurrence_graph1(w, p, d = 1):
	'''
	Given a permutation w and a pattern p we define a graph G = G(w,p) such that
	the vertices of G are occurrences of the pattern p in w. Two vertices are
	connected by an edge if and only if the corresponding occurrences differ by
	exactly one point in w
	'''

	V = map(tuple, w.pattern_positions(p))
	return Graph([ V, lambda v, u : len(list( set(v)-set(u) )) == d ])
