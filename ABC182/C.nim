import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques, heapqueue
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve():int=
  var 
    n = read().toSeq().mapIt(it.toint)
    n1 = n.filterIt(it.mod(3)==1).len
    n2 = n.filterIt(it.mod(3)==2).len
  
  if n.sum().mod(3)==0:
    result = 0
  elif n.sum().mod(3)==1:
    if n1>=1:
      result = 1
    elif n2>=2:
      result = 2
    else:
      return -1
  elif n.sum().mod(3)==2:
    if n2>=1:
      result = 1
    elif n1>=2:
      result = 2
    else:
      return -1
  if result == n.len:
    return -1




  


  

    
  

  

echo  solve()