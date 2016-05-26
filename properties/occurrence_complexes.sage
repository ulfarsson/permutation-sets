#
# Given a permutation w and a pattern p we define a complex C = C(w,p) such that
# the vertices of G are occurrences of the pattern p in w. Vertices make a face
# if and only if the corresponding occurrences differ by exactly one point in w,
# i.e,. if the intersection of the occurrences has size len(p) - 1.

#
# TODO
# 1) Compute the occurrence complex of a1 a2 ... an from the occurrence complex
#    of a2 ... an
#

def occurrence_complex(w, p):
	V = map(tuple, w.pattern_positions(p))
	faces = []

	for S in Subsets(V):
		if reduce(lambda s,t : Set(s).intersection(Set(t)), S, Set(range(len(w)))).cardinality() == len(p) - 1:
			faces.append(S)

	return SimplicialComplex(faces)

oc1 = occurrence_complex(Permutation([1,2,3]), [1,2])
oc2 = occurrence_complex(Permutation([1,2,3,4]), [1,2])

N =20
for i in range(3, N+1):
	print range(1,i)
	print range(1,i+1)
	oc = occurrence_complex(Permutation(range(1,i+1)), Permutation(range(1,i)))
	print i, oc
	print 'Homology: ', oc.homology()
	print 'Dimension: ', oc.dimension()
	print 'Nr. of facets: ', oc.facets().cardinality()
	print 'Euler characteristic: ', oc.euler_characteristic()
	print 'f_vector(): ', oc.f_vector()
	print 'g_vector(): ', oc.g_vector()
	print 'h_vector(): ', oc.h_vector()
	print ''

'''
p = 12
2 Simplicial complex with vertex set () and facets {()}
Homology:  {}
Dimension:  -1
Nr. of facets:  1
Euler characteristic:  0
f_vector():  [1]
g_vector():  [1]
h_vector():  [1]

3 Simplicial complex with vertex set ((0, 1), (0, 2), (1, 2)) and 3 facets
Homology:  {0: 0, 1: Z}
Dimension:  1
Nr. of facets:  3
Euler characteristic:  0
f_vector():  [1, 3, 3]
g_vector():  [1, 0]
h_vector():  [1, 1, 1]

4 Simplicial complex with 6 vertices and 4 facets
Homology:  {0: 0, 1: Z x Z x Z, 2: 0}
Dimension:  2
Nr. of facets:  4
Euler characteristic:  -2
f_vector():  [1, 6, 12, 4]
g_vector():  [1, 2]
h_vector():  [1, 3, 3, -3]

5 Simplicial complex with 10 vertices and 5 facets
Homology:  {0: 0, 1: Z^6, 2: 0, 3: 0}
Dimension:  3
Nr. of facets:  5
Euler characteristic:  -5
f_vector():  [1, 10, 30, 20, 5]
g_vector():  [1, 5, 0]
h_vector():  [1, 6, 6, -14, 6]

6 Simplicial complex with 15 vertices and 6 facets
Homology:  {0: 0, 1: Z^10, 2: 0, 3: 0, 4: 0}
Dimension:  4
Nr. of facets:  6
Euler characteristic:  -9
f_vector():  [1, 15, 60, 60, 30, 6]
g_vector():  [1, 9, 0]
h_vector():  [1, 10, 10, -40, 35, -10]

7 Simplicial complex with 21 vertices and 7 facets
Homology:  {0: 0, 1: Z^15, 2: 0, 3: 0, 4: 0, 5: 0}
Dimension:  5
Nr. of facets:  7
Euler characteristic:  -14
f_vector():  [1, 21, 105, 140, 105, 42, 7]
g_vector():  [1, 14, 0, -105]
h_vector():  [1, 15, 15, -90, 120, -69, 15]

'''

# w = Permutations(7).random_element()
# p = Permutations(3).random_element()

# print "Permutation", w
# print "Pattern", p

# og = occurrence_graph(w, p)

# print og
# show(og)



# Counting permutations with graphs that are connected

# N = 7
# p = [1,2,3,4]
# L = []
# for n in range(1,N+1):
# 	c = 0
# 	for perm in Permutations(n):
# 		oc = occurrence_complex(perm, p)
# 		if sum([k != 0 for k in oc.betti().values()]) == 0:
# 			c += 1
# 			# print perm
# 	print n, c
# 	print ''
# 	L.append(c)
# print ''
# print L

'''
N = 6
p = [1,2]
oc.dimension() == 1
[0, 0, 3, 9, 23, 60] A180488

N = 6
p = [1,2]
oc.is_cohen_macaulay()
[1, 2, 6, 16, 37, 80] A099099

N = 6
p = [1,2]
oc.is_flag_complex()
[1, 2, 5, 14, 42, 132] A000108

N = 6
p = [1,2]
oc.is_pure()
[1, 2, 4, 8, 15, 28] LOTS

N = 6
p = [1,2]
sum([k != 0 for k in oc.betti().values()]) == 0
Fibonacci, since we need completely disconnected, every non-inversion is an ascent?

N = 6
p = [1,2]
sum([k != 0 for k in oc.betti().values()]) == 1
[0, 0, 2, 8, 26, 76] A097040

N = 6
p = [1,2,3] or [1,3,2]
oc.is_flag_complex()
[1, 2, 6, 23, 103, 513] A005802

N = 6
p = [1,2,3]
sum([k != 0 for k in oc.betti().values()]) == 0
[1, 2, 6, 20, 71, 260] TWO NICE HITS

N = 6
p = [1,3,2]
sum([k != 0 for k in oc.betti().values()]) == 0
[1, 2, 6, 19, 64, 225]

p = [1,2,3,4]
sum([k != 0 for k in oc.betti().values()]) == 0
A128088
'''
# # See the perms
# N = 6
# p = [1,2]

# for n in range(1,N+1):
# 	L = []
# 	for perm in Permutations(n):
# 		og = occurrence_graph(perm, p)
# 		# if og.is_bipartite(): # Hit on OEIS
# 		# if og.is_chordal(): # Hit on OEIS
# 		# if og.is_clique(): # Hit on OEIS
# 		# if og.is_connected():
# 		# if og.is_forest(): # Hit on OEIS
# 		# if og.is_gallai_tree():
# 		# if og.is_line_graph(): # Always true? What IS a line graph?
# 		# if og.is_planar():
# 		# if og.is_perfect():
# 		# if og.is_regular():
# 		if og.is_tree(): # Square numbers?
# 		# if og.is_eulerian():
# 			L.append(perm)
# 	print L
# 	print ''

# Interesting
# dist = dist + x^(occurrence_graph(w,p).clique_number())
# p = [1,2]. Leading coefficient: http://oeis.org/A006932
# p = [1,2]. Coefficient of x: http://oeis.org/A000071

def dist_of_prop(p, n, prop = lambda g : True):
	dist = 0
	for w in Permutations(n):
		if prop(w):
			dist = dist + x^(len(w.pattern_positions(p)))
	return dist

# p = [1,2]
# print dist_of_prop(p, 6, prop = lambda perm : occurrence_graph(perm, p).is_tree())

#
# Open question: Does occurrence_graph(w,[1,2]) keep enough
# information about w to uniquely determine w?
#