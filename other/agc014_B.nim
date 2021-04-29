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
    (n, m) = (scan(), scan())
    a = newseq[int](m)
    b = newseq[int](m)
  for i in 0..<m:
    (a[i],b[i]) = (scan()-1,scan()-1)
  
    

    
  
echo solve()