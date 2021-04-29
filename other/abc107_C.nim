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
    (n,k) = (scan(), scan())
    x = newseqwith(n,scan())
  result = int.high-50
  for i in 0..n-k:
    if x[i+k-1]<0:
      result.min=abs(x[i])
    elif x[i]>0:
      result.min=abs(x[i+k-1])
    else:
      result.min=(min(abs(x[i]),abs(x[i+k-1]))*2+max(abs(x[i]),abs(x[i+k-1])))


  
    

    
  
echo solve()