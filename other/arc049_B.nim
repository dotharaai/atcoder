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



proc solve():float=
  var
    n = scan()
    x = newseq[float](n)
    y = newseq[float](n)
    c = newseq[float](n)
  for i in 0..<n:
    (x[i],y[i],c[i])=(scanf(),scanf(),scanf())
  
  
  proc check(t:float):bool=
    var
      dxmax = float.high
      dxmin = -float.high
      dymax = float.high
      dymin = -float.high
    for p in 0..<n:
      dxmax.min=(t/c[p]) + x[p]
      dxmin.max = -(t/c[p]) + x[p]
      dymax.min=(t/c[p]) + y[p]
      dymin.max = -(t/c[p]) + y[p]
    return dxmax>=dxmin and  dymax>=dymin

  proc binarySearch(left,right:float):float=
    var
      left = left
      right = right
    var mid:float
    for v in 0..<500:
      mid = (left+right)/2
      if not check(mid):
        left = mid
      else:
        right=mid
    return mid
  return binarySearch(0.0,1E12)

        



  
echo solve()