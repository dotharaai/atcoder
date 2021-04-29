import strutils, sequtils


proc solve(N:int):int=
  var v = newSeqWith(N,-1)
  for i in 0..<N:
    v[i]=i+1
  var t = v.filterIt(it.mod(3)!=0 and it.mod(5)!=0)
  return t.foldr(a+b)



var
  N = stdin.readline().parseInt

echo solve(N)
