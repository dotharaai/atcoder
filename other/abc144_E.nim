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



proc solve():int=
  var
    (n,k)=(scan(),scan())
    a = newseqwith(n,scan()).sorted(SortOrder.Ascending)
    f = newseqwith(n,scan()).sorted(SortOrder.Descending)

  proc check(x:int):bool=
    var k = k
    for i in 0..<n:
      if a[i]*f[i]>x:
        k -= (a[i]*f[i]-x-1+f[i]).div(f[i])
    return k>=0


  proc binS(left,right:int):int=
    if left+1==right:
      return right
    var mid = (left+right).div(2)
    if check(mid):
      return binS(left,mid)
    else:
      return binS(mid,right)
  return binS(-1,int.high.div(4))
  

      

  
  
  
echo solve()