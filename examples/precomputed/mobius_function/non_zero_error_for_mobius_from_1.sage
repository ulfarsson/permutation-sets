with open("intervals_with_nonzero_error_term.txt", "r") as myfile:
    data = myfile.read().replace('\r','')

A = dict()
for n in range(10):
    A[n] = []

for L in data.split('\n'):
    if L[0:2] == '1 ':
        perm = map(int, list(L[2:]))
        A[len(perm)].append(Permutation(perm))

    # if len(perm) > 6: break

for n in range(10):
    print n, len(A[n])