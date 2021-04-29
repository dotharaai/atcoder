import strutils, sequtils, algorithm



proc solve():int=
  var nk = stdin.readLine.split.map(parseInt)  
  var p = stdin.readLine.split.map(parseInt).sorted(SortOrder.Ascending)
  return p[0..<nk[1]].foldr(a+b)




echo solve()