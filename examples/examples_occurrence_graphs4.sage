load("../permutation-sets/properties/occurrence_graph4.sage")

'''
This file contains permutation sets defined in terms of the occurrence graph of
(version 4) the permutation

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

        print '''\nExample %s: The disjointness graph with respect to p = 12 is a tree\n''' % ex

        p = [1,2]

        prop = lambda x : occurrence_graph4(Permutation(x),p).is_tree()
        return prop, 0

    elif ex == 2:

        print '''\nExample %s: The disjointness graph with respect to p = 12 is a forest\n''' % ex

        p = [1,2]

        prop = lambda x : occurrence_graph4(Permutation(x),p).is_forest()
        return prop, 0

    elif ex == 3:

        print '''\nExample %s: The disjointness graph with respect to p = 12 is bipartite\n''' % ex

        p = [1,2]

        prop = lambda x : occurrence_graph4(Permutation(x),p).is_bipartite()
        return prop, 0

    elif ex == 8:

        print '''\nExample %s: The disjointness graph with respect to p = 12 is a clique\n''' % ex
        '''
        The basis seems to be 123, 132, 213 and the enumeration by the Fibonacci
        numbers
        '''

        p = [1,2]

        prop = lambda x : occurrence_graph4(Permutation(x),p).is_clique()
        return prop, 0

    elif ex == 9:

        print '''\nExample %s: The disjointness graph with respect to p = 132 is a clique\n''' % ex
        '''
        This might be A071969
        '''

        p = [1,3,2]

        prop = lambda x : occurrence_graph4(Permutation(x),p).is_clique()
        return prop, 0

    else:
        return lambda x : False, -1
