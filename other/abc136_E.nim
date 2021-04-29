import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
template `mod=`(x,y) = x = x mod y
template scan2 = (scan(), scan())
template scan3 = (scan(), scan())
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc scanf(): float = read().parseFloat
proc toInt(c:char): int =
    return int(c) - int('0')



proc prms(n:int):seq[int]=
  var d = 1
  while d^2<=n:
    if n.mod(d)==0:
      result.add(d)
      if d^2!=n:
        result.add(n.div(d))
    d+=1
  

proc solve():int=
  var
    (n,k) = (scan(),scan())
    a = newseqwith(n,scan())
    s = a.sum()
    ds = prms(s)
  #echo ds
  for d in ds:
    var b = a.mapIt(it.mod(d)).sorted(SortOrder.Ascending)
    var c = newseqwith(n+1,0)
    for i in 0..<n:
      c[i+1]=c[i]+b[i]
    #echo d,", "
    #echo b
    #echo c
    for i in 0..n:
      if c[i]<=k and (n-i)*d-(c[n]-c[i])<=k:
        result.max=d

  
  
echo solve()