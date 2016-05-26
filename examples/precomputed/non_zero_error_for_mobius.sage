with open("pi_such_that_some_sigma_for_which_mobius_of_sigma_pi_has_nonzero_error.txt", "r") as myfile:
    data = myfile.read().replace('\r','')

A = dict()
for n in range(10):
    A[n] = []

for L in data.split('\n'):
    perm = map(int, list(L))
    A[len(perm)].append(Permutation(perm))

for n in range(10):
    print n, len(A[n])