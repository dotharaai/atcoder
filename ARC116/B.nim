import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
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
    p = 998244353
    a = newseqwith(n,scan()).sorted(SortOrder.Ascending)

  if n>=2:
    var mul = a[n-1]
    result+=a[n-2]*mul
    result.mod=p
    #echo result
    for i in countdown(n-3,0):
      #echo i,", ", mul, " => ", mul*2+a[i+1]
      mul*=2
      mul+=a[i+1]
      mul.mod=p
      result+=a[i]*mul
      result.mod=p
    for i in 0..<n:
      result+=a[i]^2
      result.mod=p
  elif n==1:
    return (a[0]^2).mod(p)

    
    


  
  
  

  
echo solve()