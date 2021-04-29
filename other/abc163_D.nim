import sequtils, algorithm,strutils,sets

const D = 1E9.int + 7
proc solve(n,k:int):int=
  var
    mi:int
    ma:int
  for c in k..n+1:
    if c mod 2 == 0:
      mi = (c div 2)*(c-1)
      ma = (c div 2)*(2*n-c+1)
    else:
      mi = ((c-1) div 2)*c
      ma = ((2*n-c+1) div 2)*c
    result += 1 + ma - mi
    result = result mod D





var t = stdin.readline.split.map(parseint)
echo solve(t[0],t[1])