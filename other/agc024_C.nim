import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
template `mod=`(x,y) = x = x mod y
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve():int=
  var
    n = scan()
    a = newseqwith(n,scan())
  for i in 0..<n:
    if a[i]>i:
      return -1
    if i>=1 and a[i]>a[i-1]+1:
      return -1
  
  for i in 1..<n:
    if a[i-1]+1==a[i]:
      result+=1
    else:
      result+=a[i]

    
  
echo solve()

