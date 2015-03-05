load("../permutation-sets/properties/occurrence_graph1.sage")

'''
This file contains permutation sets defined in terms of the occurrence graph of
the permutation

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
'''
Example 1
The occurrence graph with respect to p = 12 is a tree

---

Example 2
The occurrence graph with respect to p = 12 is a forest

---

Example 3
The occurrence graph with respect to p = 12 is bipartite

Example 4
The occurrence graph with respect to p = 12 is chordal

Example 5
The occurrence graph with respect to p = 12 is a clique

Example 6
The occurrence graph with respect to p = 12 is a connected

---
'''

def get_example(ex):

    if ex == 1:

        p = [1,2]

        prop = lambda x : occurrence_graph1(x,p).is_tree()
        return prop, 0

    elif ex == 2:

        p = [1,2]

        prop = lambda x : occurrence_graph1(x,p).is_forest()
        return prop, 0

    elif ex == 3:

        p = [1,2]

        prop = lambda x : occurrence_graph1(x,p).is_bipartite()
        return prop, 0

    elif ex == 4:

        p = [1,2]

        prop = lambda x : occurrence_graph1(x,p).is_chordal()
        return prop, 0

    elif ex == 5:

        p = [1,2]

        prop = lambda x : occurrence_graph1(x,p).is_clique()
        return prop, 0

    elif ex == 6:

        p = [1,2]

        prop = lambda x : occurrence_graph1(x,p).is_connected()
        return prop, 0

    else:
        return lambda x : False, -1
