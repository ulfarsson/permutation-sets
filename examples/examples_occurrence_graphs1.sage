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

    if ex == 12:

    	print '''\nExample 12: The occurrence graph with respect to p = 123 is a tree\n'''

        p = [1,2,3]

        prop = lambda x : occurrence_graph1(x,p).is_tree()
        return prop, 0

    elif ex == 13:

    	print '''\nExample 13: The occurrence graph with respect to p = 123 is a forest\n'''


        p = [1,2,3]

        prop = lambda x : occurrence_graph1(x,p).is_forest()
        return prop, 0

    elif ex == 14:

    	print '''\nExample 14: The occurrence graph with respect to p = 123 is bipartite\n'''

        p = [1,2,3]

        prop = lambda x : occurrence_graph1(x,p).is_bipartite()
        return prop, 0

    elif ex == 15:

    	print '''\nExample 15: The occurrence graph with respect to p = 123 is 3-colorable\n'''

        p = [1,2,3]

        prop = lambda x : occurrence_graph1(x,p).chromatic_number() <= 3
        return prop, 0

    elif ex == 16:

    	print '''\nExample 16: The occurrence graph with respect to p = 123 is 4-colorable\n'''

        p = [1,2,3]

        prop = lambda x : occurrence_graph1(x,p).chromatic_number() <= 4
        return prop, 0

    elif ex == 17:

    	print '''\nExample 17: The occurrence graph with respect to p = 123 is planar\n'''

        p = [1,2,3]

        prop = lambda x : occurrence_graph1(x,p).is_planar()
        return prop, 0

    elif ex == 18:

    	print '''\nExample 18: The occurrence graph with respect to p = 123 is chordal\n'''

        p = [1,2,3]

        prop = lambda x : occurrence_graph1(x,p).is_chordal()
        return prop, 0

    elif ex == 19:

    	print '''\nExample 19: The occurrence graph with respect to p = 123 is a clique\n'''

        p = [1,2,3]

        prop = lambda x : occurrence_graph1(x,p).is_clique()
        return prop, 0

    elif ex == 20:

    	print '''\nExample 20: The occurrence graph with respect to p = 123 is connected\n'''

        p = [1,2,3]

        prop = lambda x : occurrence_graph1(x,p).is_connected()
        return prop, 0

    elif ex == 21:

    	print '''\nExample 21: The occurrence graph with respect to p = 123 is perfect\n'''

        p = [1,2,3]

        prop = lambda x : occurrence_graph1(x,p).is_perfect()
        return prop, 0

    elif ex == 22:

    	print '''\nExample 22: The occurrence graph with respect to p = 123 only has vertices of degree 0,1,2\n'''

        p = [1,2,3]

        def prop(x):
        	ocd = occurrence_graph1(x,p).degree_sequence()
        	for d in ocd:
        		if d > 2:
        			return False
        	return True

        return prop, 0

    if ex == 23:

    	print '''\nExample 23: The occurrence graph with respect to p = 132 is a tree\n'''

        p = [1,3,2]

        prop = lambda x : occurrence_graph1(x,p).is_tree()
        return prop, 0

    elif ex == 24:

    	print '''\nExample 24: The occurrence graph with respect to p = 132 is a forest\n'''


        p = [1,3,2]

        prop = lambda x : occurrence_graph1(x,p).is_forest()
        return prop, 0

    elif ex == 25:

    	print '''\nExample 25: The occurrence graph with respect to p = 132 is bipartite\n'''

        p = [1,3,2]

        prop = lambda x : occurrence_graph1(x,p).is_bipartite()
        return prop, 0

    elif ex == 26:

    	print '''\nExample 26: The occurrence graph with respect to p = 132 is 3-colorable\n'''

        p = [1,3,2]

        prop = lambda x : occurrence_graph1(x,p).chromatic_number() <= 3
        return prop, 0

    elif ex == 27:

    	print '''\nExample 27: The occurrence graph with respect to p = 132 is 4-colorable\n'''

        p = [1,3,2]

        prop = lambda x : occurrence_graph1(x,p).chromatic_number() <= 4
        return prop, 0

    elif ex == 28:

    	print '''\nExample 28: The occurrence graph with respect to p = 132 is planar\n'''

        p = [1,3,2]

        prop = lambda x : occurrence_graph1(x,p).is_planar()
        return prop, 0

    elif ex == 29:

    	print '''\nExample 29: The occurrence graph with respect to p = 132 is chordal\n'''

        p = [1,3,2]

        prop = lambda x : occurrence_graph1(x,p).is_chordal()
        return prop, 0

    elif ex == 30:

    	print '''\nExample 130: The occurrence graph with respect to p = 132 is a clique\n'''

        p = [1,3,2]

        prop = lambda x : occurrence_graph1(x,p).is_clique()
        return prop, 0

    elif ex == 31:

    	print '''\nExample 31: The occurrence graph with respect to p = 132 is connected\n'''

        p = [1,3,2]

        prop = lambda x : occurrence_graph1(x,p).is_connected()
        return prop, 0

    elif ex == 32:

    	print '''\nExample 32: The occurrence graph with respect to p = 132 is perfect\n'''

        p = [1,3,2]

        prop = lambda x : occurrence_graph1(x,p).is_perfect()
        return prop, 0

    elif ex == 33:

    	print '''\nExample 33: The occurrence graph with respect to p = 132 only has vertices of degree 0,1,2\n'''

        p = [1,3,2]

        def prop(x):
        	ocd = occurrence_graph1(x,p).degree_sequence()
        	for d in ocd:
        		if d > 2:
        			return False
        	return True

        return prop, 0

    else:
        return lambda x : False, -1
