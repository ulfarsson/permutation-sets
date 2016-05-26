def dist_of_prop(p, n, prop = lambda g : True):
	dist = 0
	for w in Permutations(n):
		if prop(w):
			dist = dist + x^(len(w.pattern_positions(p)))
	return dist

'''
Data from occurrence_graph1.sage
'''

# N = 7
# p = [1,2]
# L = []
# for n in range(1,N+1):
# 	c = 0
# 	for perm in Permutations(n):
# 		og = occurrence_graph1(perm, p, d = 1)
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

# Interesting
# dist = dist + x^(occurrence_graph1(w,p).clique_number())
# p = [1,2]. Leading coefficient: http://oeis.org/A006932
# p = [1,2]. Coefficient of x: http://oeis.org/A000071

# p = [1,2]
# print dist_of_prop(p, 6, prop = lambda perm : occurrence_graph1(perm, p).is_tree())


'''
Data from occurrence_graph2.sage
'''

# N = 7
# P = [1,2]
# p = [1]
# L = []
# for n in range(1,N+1):
# 	c = 0
# 	for perm in Permutations(n):
# 		og = meta_occurrence_graph2(perm, p, P)
# 		# if og.is_bipartite(): # Catalan
# 		# if og.is_chordal(): # A005802 [1, 2, 6, 23, 103, 513, 2761]
# 		# if og.is_clique(): # 1,1,1,1,1
# 		# if og.is_connected(): # Connected permutations A003319
# 			# if n >= 2:
# 				# if perm[0] != n and perm[-1] != 1:
# 		# if og.is_connected() and len(og.vertices()) != 0:
# 		# if og.is_forest(): # A001519
# 		# if og.is_gallai_tree(): No OEIS
# 		# if og.is_line_graph(): # No OEIS
# 		# if og.is_planar(): # No OEIS
# 		# if og.is_perfect(): # Everything perfect?
# 		# if og.is_regular(): # Compute one more number [1, 2, 2, 4, 2, 6, 6]
# 		# if og.is_tree(): # 2^(n-2)
# 		if og.is_eulerian(): # No OEIS [1, 1, 2, 4, 12, 35, 139]
# 					c += 1
# 					#print perm
# 	print n, c
# 	print ''
# 	L.append(c)
# print ''
# print L

# N = 7
# P = [1,2,3]
# p = [1,2]
# L = []
# for n in range(1,N+1):
# 	c = 0
# 	for perm in Permutations(n):
# 		og = meta_occurrence_graph2(perm, p, P)
# 	X	# if og.is_bipartite(): # 123-avoiders (otherwise get triangle)
# 		# if og.is_chordal(): # No OEIS, [1, 2, 6, 23, 100, 466, 2265]
# 	X	# if og.is_clique(): # 2(n-1)
# 		# if og.is_connected(): # No OEIS, [1, 2, 4, 10, 37, 200, 1403]
# 			# if n >= 2:
# 				# if perm[0] != n and perm[-1] != 1: # No OEIS [0, 1, 1, 4, 21, 136, 1040]
# 		# if og.is_connected() and len(og.vertices()) != 0: No OEIS [0, 1, 3, 9, 36, 199, 1402]
# 		# if og.is_forest(): # 123-avoiders again
# 		# if og.is_gallai_tree(): Might be A024537, which is interesting
# 		# if og.is_line_graph(): # No OEIS
# 		# if og.is_planar(): # No OEIS
# 		# if og.is_perfect(): # Might be A047889, bug in Sage
# 		# if og.is_regular(): # No OEIS [1, 2, 6, 17, 50, 148, 461]
# 		# if og.is_tree(): # n-1, trivial
# 		if og.is_eulerian(): # No OEIS [1, 2, 6, 24, 118, 680, 4515]
# 					c += 1
# 					#print perm
# 	print n, c
# 	print ''
# 	L.append(c)
# print ''
# print L

# N = 7
# P = [1,3,2]
# p = [1,2]
# L = []
# for n in range(1,N+1):
# 	c = 0
# 	for perm in Permutations(n):
# 		og = meta_occurrence_graph2(perm, p, P)
# 	X	# if og.is_bipartite(): # A005802 [1, 2, 6, 23, 103, 513, 2761]
# 		# if og.is_chordal(): # A116485 [1, 2, 6, 24, 119, 694, 4581]
# 	X	# if og.is_clique(): # A000124 [1, 2, 4, 7, 11, 16, 22]
# 		# if og.is_connected(): # Same as previous? [1, 2, 4, 7, 11, 16, 22]
# 			# if n >= 2:
# 				# if perm[0] != n and perm[-1] != 1:
# 		# if og.is_connected() and len(og.vertices()) != 0:
# 		# if og.is_forest(): # No OEIS [1, 2, 6, 23, 102, 496, 2569]
# 		# if og.is_gallai_tree(): Same as above [1, 2, 4, 7, 11, 16, 22]
# 		# if og.is_line_graph(): # No OEIS [1, 2, 6, 24, 118, 661, 3988]
# 		# if og.is_planar(): # First bad permutation is at length 6
# 		# if og.is_perfect(): # Everything is perfect
# 		# if og.is_regular(): # No OEIS
# 		# if og.is_tree(): # Odd numbers, because connected if and only if clique? [0, 1, 3, 5, 7, 9, 11]
# 		# if og.is_eulerian(): # No OEIS [1, 2, 5, 15, 48, 164, 578]
# 					c += 1
# 					#print perm
# 	print n, c
# 	print ''
# 	L.append(c)
# print ''
# print L

'''
Data from occurrence_graph3.sage
'''

# N = 8
# p = [1,2]
# L = []
# for n in range(1,N+1):
# 	c = 0
# 	for perm in Permutations(n):
# 		og = occurrence_graph3(perm, p, d = 1)
# 		# if og.is_bipartite(): # A002524 [1, 2, 6, 14, 31, 73, 172, 400]
# 		# if og.is_chordal(): # A006012 [1, 2, 6, 20, 68, 232, 792, 2704]
# 		# if og.is_clique(): # A002522 [1, 2, 5, 10, 17, 26, 37, 50]
# 		# if og.is_connected(): # No hit
# 			# if n >= 2:
# 				# if perm[0] != n and perm[-1] != 1: # A003319 [0, 1, 3, 13, 71, 461, 3447, 29093]
# 		# if og.is_connected() and len(og.vertices()) != 0:
# 		# if og.is_forest(): # A180965 [1, 2, 6, 13, 29, 68, 156, 357]
# 		# if og.is_gallai_tree(): # No hit
# 		# if og.is_line_graph(): # Always true? What IS a line graph?
# 		# if og.is_planar(): No hit
# 		# if og.is_perfect(): # Always true?
# 		# if og.is_regular(): # No hit
# 		# if og.is_tree(): # A028387 [0, 1, 5, 11, 19, 29, 41, 55]
# 		# if og.is_eulerian(): # No hit
# 			c += 1
# 			#print perm
# 	print n, c
# 	print ''
# 	L.append(c)
# print ''
# print L

# N = 8
# p = [1,2,3] # 231 gives NOTHING interesting
# L = []
# for n in range(1,N+1):
# 	c = 0
# 	for perm in Permutations(n):
# 		og = occurrence_graph3(perm, p, d = 1)
# 		# if og.is_bipartite(): # No hit
# 		# if og.is_chordal(): # No hit
# 		# if og.is_clique(): # No hit
# 		# if og.is_connected(): # No hit
# 			# if n >= 2:
# 				# if perm[0] != n and perm[-1] != 1: # No hit
# 		# if og.is_connected() and len(og.vertices()) != 0:
# 		# if og.is_forest(): # No hit
# 		# if og.is_gallai_tree(): # No hit
# 		# if og.is_line_graph(): #
# 		# if og.is_planar(): #
# 		# if og.is_perfect(): #
# 		# if og.is_regular(): #
# 		# if og.is_tree(): # No hit
# 		# if og.is_eulerian(): # No hit
# 			c += 1
# 			#print perm
# 	print n, c
# 	print ''
# 	L.append(c)
# print ''
# print L

# p = [1,2] # interesting: is_clique()

# for k in range(1,9):
# 	print k, dist_of_prop(p, k, prop = lambda perm : occurrence_graph3(perm, p).is_tree())