import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques, heapqueue
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve()=
  var 
    n = scan()
    d = 2
    r = initHeapQueue[int]()
  r.push(1)
  if n!=1:
    r.push(n)
  while d^2<=n:
    if n.mod(d)==0:
      r.push(d)
      if d^2!=n:
        r.push(n.div(d))
    d+=1
  
  while r.len>0:
    echo r.pop()

  


  

    
  

  

solve()