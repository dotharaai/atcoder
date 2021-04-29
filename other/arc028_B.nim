import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques, heapqueue
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
    (n,k)=(scan(),scan())
    x = newseqwith(n,-scan())
    q = initHeapQueue[(int,int)]()
  for i in 0..<n:
    if q.len<k:
      q.push((x[i],i))
      if q.len==k:
        echo q[0][1]+1
    else:
      if q[0][0] < x[i]:
        discard q.pop()
        q.push((x[i],i))
      echo q[0][1]+1
    #echo q
        
  
solve()