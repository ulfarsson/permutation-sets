# Generate perms with a "file system" that outputs the second biggest item it contains

class SecondStack:
        def __init__(self):
                self.size = 0
                self.top = -1
                self.stack = []

        def push(self, v):
                if self.size > 0:
                        self.stack.append(self.top)
                self.top = v
                self.size += 1

        def pop(self):
                if self.size == 0:
                        return -1
                if self.size > 1:
                        self.size -= 1
                        return self.stack.pop()
                self.size -= 1
                return self.top

class SheepStack():
    '''
    Feature request: Make k an input and replace "3-1" with "k-1"
    and "-3" with "-k"
    '''
    def __init__(self):
        self.stack = []

    def push(self, v):
        self.stack.append(v)

    def pop(self):
        if not self.stack:
            return -1
        if len(self.stack) <= 3-1:
            return self.stack.pop()

        return self.stack.pop(-3)

class MedianStack():
    '''
    Always output the "median" element
    '''
    def __init__(self):
        self.stack = []

    def push(self, v):
        self.stack.append(v)

    def pop(self):
        if not self.stack:
            return -1

        return self.stack.pop(len(self.stack)//2)

def process(steps):
        out = []
        nxt = 1
        # s = SecondStack()
        # s = SheepStack()
        s = MedianStack()
        i = 0
        while i < len(steps):
                 if steps[i] == 1 and steps[i+1] == -1:
                         out.append(nxt)
                         nxt += 1
                         i += 2
                 elif steps[i] == 1:
                         s.push(nxt)
                         nxt += 1
                         i += 1
                 else:
                         out.append(s.pop())
                         i += 1
        return out

def dp(n):
        if n == 0:
                yield []
        else:
                for k in range(n):
                        for a in dp(k):
                                for b in dp(n-1-k):
                                        yield [1] + a + [-1] + b

def ps(n): return [Permutation(process(path)) for path in dp(n)]
