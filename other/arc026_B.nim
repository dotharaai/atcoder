import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve():string=
  var
    n = scan()
    d = 1
    t=0
  while d^2 <= n:
    if n.mod(d)==0:
      t+=d
      if d < n.div(d):
        t+=n.div(d)
      
    d+=1
  t-=n
  if t<n:
    return "Deficient"
  elif t==n:
    return "Perfect"
  else:
    return "Abundant"


    
  
echo solve()