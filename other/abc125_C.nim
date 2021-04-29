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
    a = newseqwith(n,scan())
    cuml = newseqwith(n,1)
    cumr = newseqwith(n,1)
  cuml[0]=a[0]
  cumr[n-1]=a[n-1]
  for i in 1..<n:
    cuml[i]=gcd(a[i],cuml[i-1])
    cumr[n-i-1]=gcd(a[n-i-1],cumr[n-i])
  for i in 1..<n-1:
    result.max=gcd(cuml[i-1],cumr[i+1])
  result.max=max(cuml[n-2],cumr[1])

    

    
  
echo solve()