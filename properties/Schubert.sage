def is_Gorenstein(perm):
    mp1 = ([2,4,1,5,3],[(3,0),(3,1),(3,2),(3,3),(3,4),(3,5),(0,2),(1,2),(2,2),(3,2),(4,2),(5,2)])
    mp2 = ([3,1,5,2,4],[(2,0),(2,1),(2,2),(2,3),(2,4),(2,5),(0,3),(1,3),(2,3),(3,3),(4,3),(5,3)])
    if not avoids_mpats(perm,[mp1,mp2]):
        return False

    for gr in Grassmannian_perms(perm):
        if not outer_corners_balanced( associated_partition(gr) ):
            return False

    return all_corners_on_anti_diagonal(perm)

def all_corners_on_anti_diagonal(perm):
    for gr in Grassmannian_perms(perm):
        if not outer_corners_balanced( associated_partition(gr) ):
            return False

    return True

def Grassmannian_perms(perm):

    perm_descents = perm.descents()

    if not perm_descents:
        return []

    Grs = []
    for d in perm_descents:

        def append_if_small(x,y):
            if y < x[-1]:
                return x+[y]
            else:
                return x

        def append_if_big(x,y):
            if y > x[-1]:
                return x+[y]
            else:
                return x

        front = reduce(lambda x,y : append_if_small(x,y), reversed(perm[0:d]),[perm[d]])
        front.reverse()
        back  = reduce(lambda x,y : append_if_big(x,y), perm[d+2:],[perm[d+1]])

        Grs.append(to_standard(front+back))

    return Grs

def associated_partition(gr):
    lattice_path = []
    d = gr.descents()[0]
    for i in [1..len(gr)]:
        if gr.index(i) <= d:
            lattice_path.append(1) #upstep
        else:
            lattice_path.append(0) #rightstep

    return lattice_path

def outer_corners_balanced(lattice_path):

    len_l_path = len(lattice_path)

    height = sum(lattice_path)
    width  =  len_l_path - height

    vert_count = 0
    hori_count = 0

    m = []

    for (i,step) in enumerate(lattice_path):

        if step == 0:
            hori_count = hori_count + 1
        else:
            vert_count = vert_count + 1

            if i < (len_l_path - 1) and lattice_path[i+1] == 0:
                m.append((height - vert_count) + hori_count)

                if Set(m).cardinality() > 1:
                    return False
    return True
