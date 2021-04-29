import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
template `mod=`(x,y) = x = x mod y
template scan2 = (scan(), scan())
template scan3 = (scan(), scan())
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc scanf(): float = read().parseFloat
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve()=
  var
    (n,a,b) = (scan(),scanf(),scanf())
    v = newseqwith(n,scanf())
    diff = v.max-v.min
    u = v.sum/n.float
    p:float
    q:float
  if diff == 0:
    echo -1
  else:
    p = b/diff
    q = a-p*u
    echo p ," ",q



    
  
solve()