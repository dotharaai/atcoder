import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques, heapqueue
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc g1(x:int):int=
  return ($x).toSeq.sorted(SortOrder.Descending).join("").parseInt

proc g2(x:int):int=
  return ($x).toSeq.sorted(SortOrder.Ascending).join("").parseInt


proc solve():int=
  var 
    (n,k)=(scan(),scan())
  
  for i in 0..<k:
    n = g1(n) - g2(n)
  return n


    
  




  


  

    
  

  

echo  solve()