load("../permutation-sets/create_dict.sage")
load("../permutation-sets/dict_properties.sage")

def create_example(E, ex, Ng, Nb=-1, report=True, cpus=1):
    '''
    To run example 1 from examples/examples_mesh, length 6 perms do

    A, B = create_example('mesh', 1, 6)

    E      : The example file, e.g., 'mesh' or 'groups'
    ex     : The example number, 1, 2, ...
    Ng     : The length of the longest permutations to load
    Ng     : The length of the longest permutations in the complement to load
    report : Set to True to get status messages
    cpus   : The number of cores to use
             Set to 0 if you want Sage to determine the number of available cores
             Set to 1 if you want to call the single core version
    '''

    # If Nb was not set we just use Ng
    if Nb == -1:
        Nb = Ng

    # Loading requested example
    load('../permutation-sets/examples/examples_'+E+'.sage')

    prop, kind = get_example(ex)

    '''
    kind = 0 if prop is a True/False property to be applied to a single permutation
    kind = 1 if prop is a function Sn->Sn that we use to compute the permutations in the image
    kind = 2 if prop is a function that allows to generate the permutations without duplicates
    '''

    if cpus == 1:

        if kind == -1:
            print '\n!!!! No example with this number !!!!\n'
            A, B = {}, {}

        # If there is a function prop that returns True or False and can be used to
        # identify the permutations we want
        if kind == 0:
            A, B = perms_sat_prop_w_complement_different_sizes(Ng, Nb, prop, verb = report)

        # If we are looking at the image of some map Sn -> Sn
        elif kind == 1:

            A, B = perms_in_image_different_sizes(Ng, Nb, prop, verb = report)

        # If we are working with some easily creadet set, and also want the
        # complement
        elif kind == 2:
            A, B = perms_to_dicts_different_sizes(Ng, Nb, prop, verb = report)

        # Loading a precomputed example
        elif kind == 3:
            A, B = load_precomputed(Ng, Nb, prop, verb = report)

    else:

        if kind == -1:
            print '\n!!!! No example with this number !!!!\n'
            A, B = {}, {}

        A, B = {}, {}
        print 'Parallel version has not been implemented'

    if report:
        enum_perms(A)

    return A, B

# '''
# This file loads various example files. Uncomment below to run the file you want
# to load

# ex     : Example number
# Ng     : The largest permutations that satisfy the property
# Nb     : The largest permutations that do not satisfy the property
# report : Set to True to get status messages
# cpus   : The number of cores to use
#          Set to 0 if you want Sage to determine the number of available cores
#          Set to 1 if you want to call the single core version
# '''

# ex     = 1
# Ng     = 6
# Nb     = 5
# report = True
# cpus   = 1 # NOTHING ELSE IMPLEMENTED

# # These variables should not be changed manually
# no_prop     = False
# calc_image  = False
# perms_exist = False

# load('../permutation-sets/examples/examples_mesh.sage')
# # load('../permutation-sets/examples/examples_Schubert.sage')
# # load('../permutation-sets/examples/examples_various.sage')
# # load('../permutation-sets/examples/examples_sorting.sage')
# # load('../permutation-sets/examples/examples_fixed_points.sage')
# # load('../permutation-sets/examples/examples_tableaux.sage')
# # load('../permutation-sets/examples/examples_groups.sage')
# # load('../permutation-sets/examples/examples_occurrence_graphs.sage')

# '''
# At this point a specific example has been chosen and prop has been given the
# corresponding function. We now create the dictionaries
# '''

# if cpus == 1:

#     # If there is a function prop that returns True or False and can be used to
#     # identify the permutations we want
#     if not no_prop:
#         A, B = perms_sat_prop_w_complement_different_sizes(Ng, Nb, prop, verb = report)

#     # If we are looking at the image of some map Sn -> Sn
#     elif calc_image:

#         A, B = perms_in_image_different_sizes(Ng, Nb, func, verb = report)

#     # If we are working with some easily creadet set, and also want the
#     # complement
#     elif perms_exist:
#         A, B = perms_to_dicts_different_sizes(Ng, Nb, func, verb = report)

# else:
#     print 'Parallel version has not been implemented'

# enum_perms(A)
