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
    n = scan()
    a = newseqwith(n,scan())
    gcdd=0
  result=0
  
  for i in 2..a.max():
    var t = len(a.filterIt(it.mod(i)==0))
    if t > gcdd:
      result=i
      gcdd = t


  

echo solve()