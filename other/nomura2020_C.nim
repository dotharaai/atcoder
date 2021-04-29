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
    a = newseqwith(n+1,scan())
    bt = newseqwith(n+1,0)
    bb = newseqwith(n+1,0)
  bb[n]=a[n]
  bt[0]=1
  if n==0:
    if a[0]==1:
      return 1
    else:
      return -1
  for i in countdown(n-1,0):
    bb[i]=bb[i+1]+a[i]
  #echo bb
  for i in 1..n:
    bt[i] = min((bt[i-1]-a[i-1])*2,bb[i])
    if bt[i]<a[i]:
      return -1
  return bt.sum
    

    
  
echo solve()