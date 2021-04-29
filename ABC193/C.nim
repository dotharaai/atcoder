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
    #n = 10^10#scan()
    n = scan()
    a = 2
    v = initHashSet[int]()
  while a^2<=n:
    for b in 2..n:
      if a^b<=n:
        v.incl(a^b)
      else:
        break
    a+=1
  return n - v.len
  

    
  




  


  

    
  

  

echo  solve()