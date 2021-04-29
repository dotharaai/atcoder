import algorithm, sequtils, strutils, math,tables, queues



let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s
 

const inf = int.high - 5

proc read:int = get().parseInt



proc solve():int=
  var n, k = read()
  if k == 0:
    return n^2
  for b in k+1..n:
    var h = (n-k) div b + 1
    var w = b-k
    var loss = max(0,b*(h-1) + (b-1) - n)
    
    result += w*h - loss



echo solve()