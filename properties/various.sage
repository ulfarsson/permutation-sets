'''
-----------------------------------------------------------------
The function is_simple checks if a permutation is simple.
It calls the subfunction is_contiguous
-----------------------------------------------------------------
'''

def is_simple(w):

    n = len(w)

    # i = 2 corresponds to an interval of length 2
    for i in xrange(2,n):

        for j in xrange(0,n-i+1):

            if is_contiguous([w[k] for k in xrange(j,j+i)]):
                return False

    return True

def is_contiguous(lst):

    slst = sorted(lst)

    for j in xrange(0,len(lst)-1):
        if slst[j+1] - slst[j] != 1:
            return False

    return True

'''
-----------------------------------------------------------------
The function number_of_clumps outputs the number of clumps in a permutation - see
http://arxiv.org/abs/1105.3093.
It calls the subfunction is_contiguous
-----------------------------------------------------------------
'''

def max_number_of_clumps(perm):

    mc = -1

    for d in perm.descents():

        c = number_of_clumps(perm,d)
        if c > mc:
            mc = c

    return mc

def number_of_clumps(perm,d):

    front = sorted(filter(lambda x: x < perm[d] and x > perm[d+1], perm[0:d]))
    back  = sorted(filter(lambda x: x < perm[d] and x > perm[d+1], perm[d+2::]))

    c = 0

    if front:
        c = c+1
    if back:
        c = c+1

    for i in range(len(front)-1):

        if front[i+1]-front[i] > 1:
            c = c+1

    for i in range(len(back)-1):

        if back[i+1]-back[i] > 1:
            c = c+1

    return c

'''
-----------------------------------------------------------------
The function returns True on balanced permutations
-----------------------------------------------------------------
'''

def is_balanced(perm):

    n = len(perm)
    if n%4 != 0:
        return False

    else:
        return len(filter( lambda x: x <= n/2, map(lambda x: perm(x), [int(n/2+1)..n]) )) == n/4

'''
-----------------------------------------------------------------
The function returns True on menage permutations
-----------------------------------------------------------------
'''
def is_menage(perm):

    n = len(perm)
    for i in [0..len(perm)-1]:
        if perm[i]-1 == i:
            return False
        if perm[i]-1 == mod(i+1,n):
            return False
    return True

'''
-----------------------------------------------------------------
The function returns True on Kendall-Mann permutations
-----------------------------------------------------------------
'''
def is_Kendall_Mann(perm):
    n = len(perm)
    return perm.number_of_inversions() < floor(n*(n-1)/4)

'''
-----------------------------------------------------------------
The function calculates the swapping number of a permutation.
See http://www.usna.edu/Users/math/wdj/SM485_2.TXT
-----------------------------------------------------------------
'''

def swapping_number(perm):

    def e_func(i,perm):
        m = 0
        for j in [0..i-1]:
            if perm[j] > perm[i]:
                m = m+1
        return m

    return sum(map(lambda x : e_func(x,perm) , [0..len(perm)-1]))

'''
-----------------------------------------------------------------
The function returns True on fair permutations
http://mathoverflow.net/questions/113983/salie-permutations-and-fair-permutations
-----------------------------------------------------------------
'''

def is_fair(perm):
    perm_inv = perm.inverse()
    for i in range(len(perm)):
        if not ( ( perm[i] > i and perm_inv[i] > i ) or ( perm[i] <= i and perm_inv[i] <= i ) ):
            return False
    return True
