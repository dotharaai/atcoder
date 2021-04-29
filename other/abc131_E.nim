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
    (n,k)=(scan(),scan())
    e = newseqwith(n,newseq[int]())
  for i in 1..<n:
    e[0].add(i)
    e[i].add(0)
  if k > ((n-1)*(n-2)).div(2):
    echo -1
    return
  else:
    echo n - 1 + ((n-1)*(n-2)).div(2) - k
  var v = 0
  for x in 1..<n:
    for y in 1..<n:
      if x!=y and y notin e[x] and x notin e[y]:
        e[x].add(y)
        e[y].add(x)
        v+=1

      if v  == ((n-1)*(n-2)).div(2) - k:
        #echo e
        for i in 0..<n:
          for j in e[i]:
            if i<j:
              echo i+1," ",j+1
        return

  

    

    
  
solve()