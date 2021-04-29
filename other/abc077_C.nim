import algorithm, sequtils, strutils, math,tables


proc solve():int=
  var 
    n = stdin.readline.parseInt
    a = stdin.readline.split.map(parseInt).sorted#.deduplicate
    b = stdin.readline.split.map(parseInt).sorted#.deduplicate
    c = stdin.readline.split.map(parseInt).sorted#.deduplicate
  

  var ai = a.lowerBound(b[0])
  var ci = c.upperBound(b[0])
  for idx, bi in b:
    result += a.lowerBound(bi)*(n-c.upperBound(bi))



echo solve()
