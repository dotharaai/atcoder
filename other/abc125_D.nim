import algorithm, sequtils, strutils, math,tables, queues
let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s
 
proc read:int = get().parseInt


proc solve(n:int, a:seq[int]):int=
  var t = a.filterIt(it<=0)
  var abss = a.mapIt(it.abs)
  if t.len mod 2 == 1:
    return abss.sum - 2*abss.min
  else:
    return abss.sum
  
var
  n = read()
  a = stdin.readline.split.map(parseInt)

echo solve(n,a)