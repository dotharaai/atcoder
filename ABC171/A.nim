import strutils,algorithm, sequtils, math

let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s

proc read:int = get().parseInt



proc solve(x:string):char=
  var c = x[0].int
  var z = 'z'.int
  var a = 'a'.int
  if z >= c and c >= a:
    return 'a'
  else:
    return 'A'

var
  x = stdin.readline

echo solve(x)