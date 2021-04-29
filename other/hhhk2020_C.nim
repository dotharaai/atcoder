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
    n = scan()
    p = newSeqWith(n,scan())
    exist = newseqwith(2*10^6,false)
    idx = 0
  for i in 0..<n:
    exist[p[i]]=true
    while exist[idx]:
      idx+=1
    echo idx
  
  
  

  
solve()