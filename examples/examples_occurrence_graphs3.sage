load("../permutation-sets/properties/occurrence_graph3.sage")

'''
This file contains permutation sets defined in terms of the occurrence graph of
(version 3) the permutation

All inputs defined in the file create_permutation_set.sage
ex     : Example number
Ng     : The largest permutations that satisfy the property
Nb     : The largest permutations that do not satisfy the property
report : Set to True to get status messages
cpus   : The number of cores to use
         Set to 0 if you want Sage to determine the number of available cores
         Set to 1 if you want to call the single core version
'''

# ------------------------------------------------------------------------------

def get_example(ex):

    if ex == 1:

        print '''\nExample 1: The meta-occurrence graph with respect to p = 12, P = 132 is a clique\n'''

        p = [1,2]
        P = [1,3,2]

        prop = lambda x : occurrence_graph2(Permutation(x),p,P).is_clique()
        return prop, 0

    elif ex == 2:

        print '''\nExample 2: The meta-occurrence graph with respect to p = 12, P = 132 is bipartite\n'''

        p = [1,2]
        P = [1,3,2]

        prop = lambda x : occurrence_graph2(Permutation(x),p,P).is_bipartite()
        return prop, 0

    elif ex == 3:

        print '''\nExample 3: The meta-occurrence graph with respect to p = 12, P = 123 is a clique\n'''

        p = [1,2]
        P = [1,2,3]

        prop = lambda x : occurrence_graph2(Permutation(x),p,P).is_clique()
        return prop, 0

    else:
        return lambda x : False, -1
