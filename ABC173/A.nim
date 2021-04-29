import strutils,algorithm, sequtils, math

let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s

proc read:int = get().parseInt



proc solve():int=
  var 
    n = stdin.readLine.parseFloat
    #y = stdin.readline.split.map(parseInt)
  return (n/1000).ceil.int*1000 - n.int
  

echo solve()