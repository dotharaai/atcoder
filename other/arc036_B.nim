import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve():int=
  var
    n = scan()
    h = newseqwith(n,scan())
    top = newseq[int](0)
  if n == 1:
    return 1
  for i in 1..<n-1:
    if h[i-1] <= h[i] and h[i] >= h[i+1]:
      top.add(i)
  if h[0]>=h[1]:
    top.add(0)
  if h[n-2] <= h[n-1]:
    top.add(n-1)
  #echo top
  for idx, t in top:
    var
      l = 0
      r = 0
    while t-l-1 >= 0 and h[t-l-1]<=h[t-l]:
      l+=1
    while t+r+1 < n  and h[t+r]>=h[t+r+1]:
      r+=1
    #echo l, ", ", r
    result.max=(r+l+1)
    

  



  

  
    

    
  
echo solve()