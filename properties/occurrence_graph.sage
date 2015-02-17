#
# Given a permutation w and a pattern p we define a graph G = G(w,p) such that
# the vertices of G are occurrences of the pattern p in w. Two vertices are
# connected by an edge if and only if the corresponding occurrences differ by
# exactly one point in w
#

def occurrence_graph(w, p, d = 1):
	V = map(tuple, w.pattern_positions(p))
	return Graph([ V, lambda v, u : len(list( set(v)-set(u) )) == d ])

# w = Permutations(7).random_element()
# p = Permutations(3).random_element()

# print "Permutation", w
# print "Pattern", p

# og = occurrence_graph(w, p)

# print og
# show(og)



# Counting permutations with graphs that are connected

# N = 7
# p = [1,2]
# L = []
# for n in range(1,N+1):
# 	c = 0
# 	for perm in Permutations(n):
# 		og = occurrence_graph(perm, p, d = 1)
# 		# if og.is_bipartite(): # Hit on OEIS
# 		# if og.is_chordal(): # Hit on OEIS
# 		# if og.is_clique(): # Hit on OEIS
# 		if og.is_connected():
# 			if n >= 2:
# 				if perm[0] != n and perm[-1] != 1:
# 		# if og.is_connected() and len(og.vertices()) != 0:
# 		# if og.is_forest(): # Hit on OEIS
# 		# if og.is_gallai_tree():
# 		# if og.is_line_graph(): # Always true? What IS a line graph?
# 		# if og.is_planar():
# 		# if og.is_perfect():
# 		# if og.is_regular():
# 		#if og.is_tree(): # Square numbers?
# 		# if og.is_eulerian():
# 					c += 1
# 					#print perm
# 	print n, c
# 	print ''
# 	L.append(c)
# print ''
# print L

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