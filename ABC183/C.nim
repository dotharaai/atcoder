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
    (n,k)=(scan(),scan())
    ts = newseqwith(n,newseqwith(n,scan()))
    nexts = newseqwith(n-1,0)
  proc length(nexts:seq[int]):int=
    var
      l = 0
      now=0
    for next in nexts:
      l+=ts[now][next]
      now=next
    l+=ts[nexts[n-2]][0]
    return l


  for i in 1..<n:
    nexts[i-1]=i
  
  if nexts.length==k:
    result+=1
  while nexts.nextPermutation:
    if  nexts.length==k:
      result+=1
  return result
  
  




  


  

    
  

  

echo  solve()