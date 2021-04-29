import strutils, algorithm, sequtils


proc solve(N:int):int=
  var a = newSeqWith(N,0)
  for i in 0..<N:
    a[i]=i+1
  return a.filterIt(it.mod(3) != 0).foldr(a+b)



var
  N = stdin.readline().parseInt

echo solve(N)
