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
    a = newseqwith(n,scan()).sorted(SortOrder.Ascending)
    ca = newseqwith(n+1,0)
  for i in 0..<n:
    ca[i+1] = ca[i]+a[i]
    if ca[i]*2 < a[i]:
      result = i
  result = n-result
  
  
    

    
  
echo solve()