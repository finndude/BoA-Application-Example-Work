import sys
from sympy import *

def parse_input():
    rows = []
    for line in sys.stdin:
        rowstr = line.split(',')
        if len(rowstr) == 0:
            break
        row = []
        for item in rowstr:
            nd = item.split('/')
            if len(nd) == 1:
                nd.append(1)
            row.append(Rational(nd[0],nd[1]))
        rows.append(row)
    return Matrix(rows)

def rational_string(r, sep="."):
    if r.q == 1:
        return str(r.p)
    else:
        return "{0}{1}{2}".format(r.p, sep, r.q)

def print_matrix(M):
    r = M.shape[0]
    c = M.shape[1]
    for i in range(r):
        row = []
        for j in range(c):
            row.append(rational_string(A[i,j], sep="/"))
        print(",".join(row))

def swap_string(i,j): # Ri <-> Rj
    return "s{0}:{1}".format(i,j)

def replace_string(i,j,c): # Ri = Ri + cRj
    return "r{0}:{1}:{2}".format(j,rational_string(c),i)

def scale_string(i,c): # Ri = cRi
    return "m{0}:{1}".format(i,rational_string(c))

A = parse_input()

#######################################################
# convert A to reduced row echelon form
# with row operation steps recorded in the list ops
ops = []

# INSERT YOUR CODE HERE
# ...
# swap
# ops.append(swap_string(i,j))
# A = A.elementary_row_op("n<->m",row1=i,row2=j
# ...
# scale
# ops.append(scale_string(i,c))
# A = A.elementary_row_op("n->kn",row=i,k=c)
# ...
# replace
# ops.append(replace_string(i,j,c))
# A = A.elementary_row_op("n->n+km",row=i,row2=j,k=c)
# ...

#######################################################

print("ops=", end="")
print(",".join(ops))
print_matrix(A)
