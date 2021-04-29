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



proc solve():string=
  var
    n = scan()
    m = scan()
    a = newseqwith(n,scan()).toHashSet()
    b = newseqwith(m,scan()).toHashSet()
    v = ((a + b) - (a*b)).toseq()
  v.sort()
  return v.join(" ")

  
  
  

  
  

echo solve()