import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques,heapqueue
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


proc cmp(a,b:(int,int,int)):int=
  return cmp(a[0],b[0])

proc solve():int=
  var
    (h,w)=(scan(),scan())
    stage = newseqwith(w+2,-1) & newseqwith(h,@[-1] & newseqwith(w,scan()) & @[-1]) & newseqwith(w+2,-1)
    routes = newseqwith(h+2,newseqwith(w+2,0))
    heapnum = initHeapQueue[(int,int,int)]()
    D = 1E9.int+7
    nums = newseq[(int,int,int)]()
  for nh in 1..h:
    for nw in 1..w:
      routes[nh][nw]=1
      heapnum.push((stage[nh][nw],nh,nw))
  while heapnum.len>0:
    var (n,nh,nw) = heapnum.pop()
    if stage[nh+1][nw]>stage[nh][nw]:
      routes[nh+1][nw]+=routes[nh][nw]
      routes[nh+1][nw].mod=D
    if stage[nh-1][nw]>stage[nh][nw]:
      routes[nh-1][nw]+=routes[nh][nw]
      routes[nh-1][nw].mod=D
    if stage[nh][nw+1]>stage[nh][nw]:
      routes[nh][nw+1]+=routes[nh][nw]
      routes[nh][nw+1].mod=D
    if stage[nh][nw-1]>stage[nh][nw]:
      routes[nh][nw-1]+=routes[nh][nw]
      routes[nh][nw-1].mod=D
  for nh in 1..h:
    for nw in 1..w:
      result+=routes[nh][nw]
      result.mod=D
  
  

    
  
echo solve()