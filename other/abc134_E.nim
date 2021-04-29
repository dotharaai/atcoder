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





proc solve():int=
  var
    n = scan()
    a = newseqwith(n,scan())
    mins = initDeque[int]()
    
  proc binSearch(left,right,search:int):int=
    if mins[right]<search:
      return right
    
    if left+1==right or left==right:
      return left
    else:
      var mid = (left+right).div(2)
      if mins[mid]>=search:
        return binSearch(left,mid,search)
      else:
        return binSearch(mid,right,search)
  
  

  mins.addLast(a[0])
  for idx in 1..<n:
    if a[idx]<=mins[0]:
      mins.addFirst(a[idx])
    else:
      var ins = binsearch(0,mins.len-1,a[idx])
      mins[ins]=a[idx]
    #echo mins
    
  
  return mins.len
  
echo solve()