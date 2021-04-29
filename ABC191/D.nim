import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc scanf(): float = read().parseFloat
proc toInt(c:char): int =
    return int(c) - int('0')


proc solve():int=
  var
    x = read().toSeq.mapIt(it.toint)
    m = scan()
    start = x.max()+1
    #memo = initHashSet[int]()

  proc possible(d:int):bool=
    var
      digits = x.len-1
      t = x[0]
    for i in 1..digits:
      if t>m:
        return false
      try:
        t*=d
        if t>m:
          return false
      except:
        return false
    return t<=m

  proc toM(d:int):bool=
    var t = 0
    if not possible(d):
      return false
    for i in 1..x.len:
      t+=x[x.len-i]*(d^(i-1))
      if t>m:
        return false
    return t<=m

  proc binsearch(left,right:int):int=
    if left+1==right:
      return left
    else:
      var mid = (left+right).div(2)
      if toM(mid):
        return binsearch(mid,right)
      else:
        return binsearch(left,mid)

  if x.len==1:
    if x[0]<=m:
      return 1
    else:
      return 0

  if not toM(start):
    return 0
  else:
    var left = binsearch(start,int.high.div(2))
    return left-start+1




    
echo solve()