import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques, heapqueue
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve():string=
  var 
    n = scan()
    x = newseq[int](n)
    y = newseq[int](n)
  # xi=xj=xkなら存在する
  for i in 0..<n:
    (x[i],y[i])=(scan(),scan())

  for p1 in 0..<n:
    for p2 in p1+1..<n:
      for p3 in p2+1..<n:
        if x[p1]==x[p2] and x[p2]==x[p3]:
          return "Yes"
        elif y[p1]==y[p2] and y[p2]==y[p3]:
          return "Yes"
        elif (x[p3]-x[p2])*(y[p1]-y[p2])==(y[p3]-y[p2])*(x[p1]-x[p2]):
          return "Yes"
  return "No"


  


  

    
  

  

echo  solve()