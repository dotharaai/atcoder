import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques, heapqueue
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
template `mod=`(x,y) = x = x.mod(y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')


proc solve():int=
  var 
    n = scan()
    member = newseqwith(n,newseqwith(5,scan()))
  

  proc check(mid:int):bool=
    var
      pattern = newseqwith(32+1,0)
    for i in 0..<n:
      var v = 0
      for j in 0..<5:
        if member[i][j]>=mid:
          v+=1*2^j
      
      pattern[v]+=1
    for i in 0..<2^5:
      for j in 0..<2^5:
        for k in 0..<2^5:
          pattern[i]-=1
          pattern[j]-=1
          pattern[k]-=1
          if (pattern[i] >= 0 and pattern[j] >= 0 and pattern[k] >= 0) and (i or j or k) == 2^5-1:
            return true
          pattern[i]+=1
          pattern[j]+=1
          pattern[k]+=1
    return false


    

  proc binS(left,right:int):int=

    if left+1==right:
      return left
    var
      mid = (left+right).div(2)
    if check(mid):
      return binS(mid,right)
    else:
      return binS(left,mid)
  return binS(0,10^9+1)

    
echo solve()