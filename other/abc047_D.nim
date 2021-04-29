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


proc solve():int=
  var
    (n,t)=(scan(),scan())
    a = newseqwith(n,scan())
    dist = initTable[int,int]()
    cummin = newseqwith(n,int.high.div(4))
    cummax = newseqwith(n,0)
  cummin[0]=a[0]
  cummax[n-1]=a[n-1]
  for i in 1..<n:
    cummin[i]=min(cummin[i-1],a[i])
    cummax[n-1-i] = max(cummax[n-i],a[n-i-1])
  for i in 0..<n:
    dist[a[i]]=i
  var
    idx = 0
    mdiff = 0
  for i in 0..<n-1:
    if mdiff < cummax[i+1]-cummin[i]:
      mdiff=cummax[i+1]-cummin[i]
      idx=i
  for i in 0..<n:
    var val = a[i]
    if dist.haskey(val+mdiff):
      if i<dist[val+mdiff]:
        result+=1
  
    
  
echo solve()