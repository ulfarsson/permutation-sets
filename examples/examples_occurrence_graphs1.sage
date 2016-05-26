load("../permutation-sets/properties/occurrence_graph1.sage")

'''
This file contains permutation sets defined in terms of the occurrence graph
(version 1) of the permutation

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

    	print '''\nExample 1: The occurrence graph with respect to p = 12 is a tree\n'''

        p = [1,2]

        prop = lambda x : occurrence_graph1(x,p).is_tree()
        return prop, 0

    elif ex == 2:

    	print '''\nExample 2: The occurrence graph with respect to p = 12 is a forest\n'''


        p = [1,2]

        prop = lambda x : occurrence_graph1(x,p).is_forest()
        return prop, 0

    elif ex == 3:

    	print '''\nExample 3: The occurrence graph with respect to p = 12 is bipartite\n'''

        p = [1,2]

        prop = lambda x : occurrence_graph1(x,p).is_bipartite()
        return prop, 0

    elif ex == 4:

    	print '''\nExample 4: The occurrence graph with respect to p = 12 is 3-colorable\n'''

        p = [1,2]

        prop = lambda x : occurrence_graph1(x,p).chromatic_number() <= 3
        return prop, 0

    elif ex == 5:

    	print '''\nExample 5: The occurrence graph with respect to p = 12 is 4-colorable\n'''

        p = [1,2]

        prop = lambda x : occurrence_graph1(x,p).chromatic_number() <= 4
        return prop, 0

    elif ex == 6:

    	print '''\nExample 6: The occurrence graph with respect to p = 12 is planar\n'''

        p = [1,2]

        prop = lambda x : occurrence_graph1(x,p).is_planar()
        return prop, 0

    elif ex == 7:

    	print '''\nExample 7: The occurrence graph with respect to p = 12 is chordal\n'''

        p = [1,2]

        prop = lambda x : occurrence_graph1(x,p).is_chordal()
        return prop, 0

    elif ex == 8:

    	print '''\nExample 8: The occurrence graph with respect to p = 12 is a clique\n'''

        p = [1,2]

        prop = lambda x : occurrence_graph1(x,p).is_clique()
        return prop, 0

    elif ex == 9:

    	print '''\nExample 9: The occurrence graph with respect to p = 12 is connected\n'''

        p = [1,2]

        prop = lambda x : occurrence_graph1(x,p).is_connected()
        return prop, 0

    elif ex == 10:

    	print '''\nExample 10: The occurrence graph with respect to p = 12 is perfect\n'''

        p = [1,2]

        prop = lambda x : occurrence_graph1(x,p).is_perfect()
        return prop, 0

    elif ex == 11:

    	print '''\nExample 11: The occurrence graph with respect to p = 12 only has vertices of degree 0,1,2\n'''

        p = [1,2]

        def prop(x):
        	ocd = occurrence_graph1(x,p).degree_sequence()
        	for d in ocd:
        		if d > 2:
        			return False
        	return True

        return prop, 0

    else:
        return lambda x : False, -1
