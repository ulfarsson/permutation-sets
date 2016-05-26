def occurrence_graph4(w, p, d = 1):
    '''
    Given a permutation w and a pattern p we define a graph G = G(w,p) such that
    the vertices of G are occurrences of the pattern p in w. Two vertices are
    connected by an edge if and only if the corresponding occurrences are
    disjoint. Note that this means that G(123, 12) is a disconnected graph on 3
    vertices.
    '''
    V = map(tuple, w.pattern_positions(p))
    return Graph([ V, lambda v, u : Set(v).intersection(Set(u)).is_empty() ])
