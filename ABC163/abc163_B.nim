import strutils, sequtils

let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s

proc read:int = get().parseInt



proc solve(N:int):int=
  var v = newSeqWith(N,-1)
  for i in 0..<N:
    v[i]=i+1
  var t = v.filterIt(it.mod(3)!=0 and it.mod(5)!=0)
  return t.foldr(a+b)



var
  N,M = read()

echo solve(N)
