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



proc solve()=
  var 
    n = scan()
    buy = false
    result = int.high
  for i in 0..<n:
    var (a,p,x)=(scan(),scan(),scan())
    if x-a > 0:
      buy = true
      result.min=p
  if buy:
    echo result
  else:
    echo -1


solve()