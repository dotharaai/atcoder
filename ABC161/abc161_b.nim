import strutils, algorithm, sequtils

proc solve():string=
  var 
    nm = stdin.readLine.split(" ").mapIt(it.parseInt)
    a = stdin.readLine.split(" ").mapIt(it.parseInt)
    l = a.filterIt(it*4*nm[1] >= a.foldl(a+b)).len
  if l>=nm[1]:
    return "Yes"
  else:
    return "No"

echo solve()