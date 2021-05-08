import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
template `mod=`(x,y) = x = x.mod(y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc scanf(): float = read().parseFloat
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve():float=
  var
    n = scan()
    d = scanf()
    h = scanf()
    dh = newseqwith(n,(scanf(),scanf()))
    eps = 1E-5

  proc check(p:float):bool=
    result = true
    #echo p
    for (di,hi) in dh:
      #echo ((hi-p)*d <= (h-p)*di)
      result = result and ((hi-p)*d <= (h-p)*di)
      

  proc binS(lo,hi:float):float=
    #echo lo, ", ", hi
    if lo+eps >= hi:
      return lo
    else:
      var mid = (lo+hi)/2
      if check(mid):
        return binS(lo,mid)
      else:
        return binS(mid,hi)
  return binS(0.0,h)

  

  
  

echo solve()