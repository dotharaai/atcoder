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
    a = newseqwith(n,scan())
    c = newseqwith(n,int.high.div(4))
  c[0]=0
  c[1]=abs(a[1]-a[0])
  for i in 2..<n:
    c[i] = min(c[i-1]+abs(a[i]-a[i-1]), c[i-2]+abs(a[i]-a[i-2]))
  return c[n-1]

echo solve()