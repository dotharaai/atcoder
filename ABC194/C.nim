import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques, heapqueue
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
    a = newseqwith(n,scan())
    ca = newseqwith(n,0)
    caa = newseqwith(n,0)
  ca[0]=a[0]
  caa[0]=a[0]^2
  for i in 1..<n:
    ca[i]=ca[i-1]+a[i]
    caa[i]=caa[i-1]+a[i]^2
  for i in 1..<n:
    result += ((i)*a[i]^2-2*a[i]*ca[i-1] + caa[i-1])
  
  

echo  solve()