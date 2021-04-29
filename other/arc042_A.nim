import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')




proc solve():string=
  var
    (n,m) = (scan(),scan())
    a = newseqwith(m,scan()).reversed()
    ap = initSet[int]()
    r = newseq[int](0)
  
  for i,v in a:
    if v notin ap:
      ap.incl(v)
      r.add(v)
  for i in 1..n:
    if i notin ap:
      r.add(i)
  
  return r.join("\n")
  
    

    
  
echo solve()