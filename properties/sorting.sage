def is_sorted(w):
    '''
    Return true if w is increasing, i.e., sorted

    EXAMPLES
    sage: is_sorted([1,3,2])
    False
    '''

    n = len(w)

    if n <= 1:
        return True

    for i in range(n-1):
        if w[i] > w[i+1]:
            return False

    return True

#
# helper function for stack-sort and bubble-sort. finds the location of the maximal element
#

def loc_max(w):

    L = max(w)

    for i in [0..L-1]:
        if w[i] == L:
            return i

#
# function takes a permutation w and does one pass of stack-sort on it
#

def stack_sort(w):

    i = len(w)

    if i == 0:
        return []

    if i == 1:
        return w
    else:
        [j,J] = [loc_max(w),max(w)]

        if j == 0:
            W2 = list(stack_sort(w[1:i]))
            W2.append(J)

            return W2

        if j == i-1:
            W1 = list(stack_sort(w[0:i-1]))
            W1.append(J)

            return W1


        else:
            W1 = list(stack_sort(w[0:j]))
            W2 = list(stack_sort(w[j+1:i]))

            W1.extend(W2)
            W1.extend([J])

            return W1

#
# function takes a permutation w and does one pass of bubble-sort on it
#

def bubble_sort(w):

    i = len(w)

    if i == 0:
        return []

    if i == 1:
        return w
    else:
        [j,J] = [loc_max(w),max(w)]

        if j == 0:
            W2 = w[1:i]
            W2.append(J)

            return W2

        if j == i-1:
            W1 = list(bubble_sort(w[0:i-1]))
            W1.append(J)

            return W1


        else:
            W1 = list(bubble_sort(w[0:j]))
            W2 = w[j+1:i]

            W1.extend(W2)
            W1.extend([J])

            return W1