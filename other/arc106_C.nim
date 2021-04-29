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
    (n,m)=(scan(),scan())
    ls = newseqwith(n,0)
    rs = newseqwith(n,0)
    gaps = newseqwith(n,0)
  if 0 <= m and m<=max(0,n-2):
    var idx=1
    for i in 0..<n:
      (ls[i],rs[i])=(idx,idx+1)
      gaps[i]=idx+2
      idx+=3
    if m!=0:
      rs[0]=gaps[m+1]
    for i in 0..<n:
      echo ls[i]," ",rs[i]
  else:
    echo -1

  
    

    
  
solve()