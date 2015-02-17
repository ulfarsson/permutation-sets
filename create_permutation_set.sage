load("../permutation-sets/create_dict.sage")
load("../permutation-sets/dict_properties.sage")

'''
This file loads various example files. Uncomment below to run the file you want
to load

ex     : Example number
Ng     : The largest permutations that satisfy the property
Nb     : The largest permutations that do not satisfy the property
report : Set to True to get status messages
cpus   : The number of cores to use
         Set to 0 if you want Sage to determine the number of available cores
         Set to 1 if you want to call the single core version
'''

ex     = 6
Ng     = 7
Nb     = 4
report = True
cpus   = 1 # NOTHING ELSE IMPLEMENTED

load('../permutation-sets/examples/examples_mesh.sage')
# load('../permutation-sets/examples/examples_occurrence_graphs.sage')

'''
At this point a specific example has been chosen and prop has been given the
corresponding function. We now create the dictionaries
'''

if cpus == 1:
    A, B = perms_sat_prop_w_complement_different_sizes(Ng, Nb, prop, verb = report)
else:
    print 'Parallel version has not been implemented'

enum_perms(A)
