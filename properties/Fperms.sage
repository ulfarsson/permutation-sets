# Generate perms with an F-rule
# F(n) = a subset of [n]
# An F-perm of length n has its first element in F[n] and its standardised
# tail is an F-perm.

class FPerm:
    def __init__(self, f):
        self.f = f

    def generator(self, n):
        if (n == 1):
            yield [1]
        else:
            for m in self.f(n):
                for p in self.generator(n-1):
                    yield self.adjust(m, p)

    def adjust(self, m, p):
        result = [m]
        for v in p:
            if v >= m:
                result.append(v+1)
            else:
                result.append(v)
        return result

    def perms(self, n): return [Permutation(p) for p in self.generator(n)]

class FKPerm:
    def __init__(self, f):
        self.f = f

    def generator(self, k, n):
        if (n == 1):
            if self.f(k,n):
                yield [1]
        else:
            for m in self.f(k,n):
                for p in self.generator(m, n-1):
                    yield self.adjust(m, p)

    def adjust(self, m, p):
        result = [m]
        for v in p:
            if v >= m:
                result.append(v+1)
            else:
                result.append(v)
        return result

    def perms(self, n): return [Permutation(p) for p in self.generator(-1, n)]
