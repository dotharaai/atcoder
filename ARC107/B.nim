import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc scanf(): float = read().parseFloat
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve():int=
  var 
    (n,k)=(scan(),scan())
  for x in 2..2*n:
    var y = x-k
    if 2<=y and y <= 2*n:
      result+=(min(x-1,n)-max(x-n,1)+1)*(min(y-1,n)-max(y-n,1)+1)
    





echo solve()