import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve():int=
  var 
    n = scan()
    x = newseq[int](n)
    y = newseq[int](n)
    fx = newseq[int](n)
    fy = newseq[int](n)
  for i in 0..<n:
    (x[i],y[i]) = (scan(),scan())
    (fx[i], fy[i]) = (x[i]-y[i], x[i]+y[i])
  result = max(
    max(fx)-min(fx),
    max(fy)-min(fy)
  )
  

echo solve()