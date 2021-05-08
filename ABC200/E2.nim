import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques, heapqueue
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
template `mod=`(x,y) = x = x.mod(y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')




proc solve():int=
  var
    h = scan()
    w = scan()
    es = newseqwith(h*w,newseq[int]())
    cost = newseqwith(h*w,newseq[int]())
    a = newseqwith(h,newseqwith(w-1,scan()))
    b = newseqwith(h-1,newseqwith(w,scan()))
  proc getIdx(y,x:int):int=
    return y*w+x
  for y in 0..<h:
    for x in 0..<w:
      if x > 0:
        es[getIdx(y,x)].add(getIdx(y,x-1))
        cost[getIdx(y,x)].add(a[y][x-1])
      if x+1 < w:
        es[getIdx(y,x)].add(getIdx(y,x+1))
        cost[getIdx(y,x)].add(a[y][x])
      if y+1<h:
        es[getIdx(y,x)].add(getIdx(y+1,x))
        cost[getIdx(y,x)].add(b[y][x])
      #for i in 0..<y:
        #es[getIdx(y,x)].add(getIdx(i,x))
        #cost[getIdx(y,x)].add(y-i+1)
  
  var dist = newseqwith(h*w,int.high.div(2))
  proc dij(sy,sx:int)=
    dist[getIdx(sy,sx)] = 0
    # cost, from, to
    var q = initHeapQueue[(int,int)]()
    q.push((0,getIdx(sy,sx)))
    while q.len>0:
      var
        (c,p) = q.pop()
      if dist[p] < c:
        continue
      for idx in 0..<es[p].len:
        if dist[es[p][idx]] > dist[p]+cost[p][idx]:
          dist[es[p][idx]] = dist[p]+cost[p][idx]
          q.push((dist[es[p][idx]], es[p][idx]))
      var
        y = p.div(w)
        x = p.mod(w)
      for i in 0..<y:
        if dist[getIdx(i,x)] > dist[p] + y-i+1:
          dist[getIdx(i,x)] = dist[p]+y-i+1
          q.push((dist[getIdx(i,x)], getIdx(i,x)))


  
  dij(0,0)

  return dist[getIdx(h-1,w-1)]


  
  

  
      

  

    

echo solve()