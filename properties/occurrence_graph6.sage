def occurrence_graph6(w, p):
    '''
    Given a permutation w and a pattern p we define a graph G = G(w,p) such that
    the vertices of G are occurrences of the pattern p in w. Two vertices u, v,
    are connected by an edge if and only if the occurrence corresponding to u
    ends where the occurrence corresponding to v starts.
    '''
    V = map(tuple, w.pattern_positions(p))
    return Graph([ V, lambda v, u : v[-1] == u[0] ])
