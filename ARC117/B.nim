import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
template `mod=`(x,y) = x = x.mod(y)
template `mod=`(x,y) = x = x mod y
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc scanf(): float = read().parseFloat
proc toInt(c:char): int =
    return int(c) - int('0')




proc solve():int=
  var
    n = scan()
    a = @[0] & newseqwith(n,scan()).sorted(SortOrder.Ascending)
    md = 10^9+7
  result = 1
  for i in 1..n:
    result = ((a[i]-a[i-1]+1)*result).mod(md)
  
    


  
  
  

  
echo solve()