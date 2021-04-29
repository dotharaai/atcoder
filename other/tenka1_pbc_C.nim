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
    a = newseqwith(n,scan()).sorted(SortOrder.Descending)
  if n mod 2 == 0:
    for i in 0..<n div 2 - 1:
      result += 2*a[i]
    result += a[n div 2 - 1]
    result -= a[n div 2]
    for i in (n div 2 + 1)..<n:
      result-=2*a[i]
  else:
    if n == 3:
      result = max(2*a[0]-a[1]-a[2],a[0]+a[1]-2*a[2])
    else:
      var t = 0
      for i in 0..<(n-1) div 2:
        t+=2*a[i]
      t -= a[(n-1) div 2] + a[(n-1) div 2 + 1]
      for i in (n-1) div 2 + 2..<n:
        t -= 2*a[i]

  
      for i in 0..<(n-1) div 2 - 1:
        result+=2*a[i]
      result += a[(n-1) div 2 - 1]+a[(n-1) div 2]
      for i in (n-1) div 2+1..<n:
        result-=2*a[i]
      result.max=t








    

    
  
echo solve()