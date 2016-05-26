def occurrence_graph2(w, p, d = 1):
    '''
    Given a permutation w and a pattern p we define a graph G = G(w,p) such that
    the vertices of G are occurrences of the pattern p in w. Two vertices are
    connected by an edge if and only if the corresponding occurrences differ by
    exactly one point in w, and this point plays the same role in p. Note that
    this means that 12 and 23 are not connected in 123.
    '''
    V = map(tuple, w.pattern_positions(p))
    return Graph([ V, lambda v, u : sum([v[i] != u[i] for i in range(len(v))]) == d ])

