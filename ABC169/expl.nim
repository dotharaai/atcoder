import math


proc modPow(A: int, N: int, P: int): int =
  var (a, n, p) = (A, N, P)
  result = 1
  while n > 0:
    if (n and 1) == 1:
      result = result * a mod p
    a = a * a mod p
    n = n shr 1
 

var d = 23
for i in 1..50:
  for j in 1..50:
    echo i, " * ", j, " = ", i*j, ", ",(i*j).mod(d), ", ", (i.mod(d)*j.mod(d)).mod(d)