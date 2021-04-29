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



proc solve():int=
  var
    n = scan()
    a = newseq[int](n)
    b = newseq[int](n)
  
  for i in 0..<n:
    (a[i],b[i]) = (scan(),scan())
  a.sort
  b.sort
  var
    am:int
    bm:int
  if n.mod(2)==0:
    am = (a[n div 2] + a[n div 2 - 1]) * 10 div 2
    bm = (b[n div 2] + b[n div 2 - 1]) * 10 div 2
    result = (bm-am) div 5 + 1
  else:
    am = a[n div 2]
    bm = b[n div 2]
    result = bm-am + 1


  
    

    
  
echo solve()