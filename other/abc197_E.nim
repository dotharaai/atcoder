import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques, heapqueue
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
    n =  scan()
    cMin = newseqwith(n+1,int.high)
    cMax = newseqwith(n+1,-int.high)
    colExists = newseqwith(n+1,false)
    
  for i in 0..<n:
    var
      (x,c)=(scan(),scan())
    colExists[c]=true
    cMin[c].min=x
    cMax[c].max=x

  var
    colNum = colExists.count(true)
    es = newseqwith(colNum*2+2,newseq[int]())
    costs = newseqwith(colNum*2+2,newseq[int]())
    eCmax = newseq[int]()
    eCmin = newseq[int]()
  for c in 0..n:
    if colExists[c]:
      eCmax.add(cMax[c])
      eCmin.add(cMin[c])

  for c in 0..<colNum:
    if c==0:
      es[0].add(2*c+1)
      costs[0].add(
        abs(eCmin[c])+abs(eCmax[c]-eCmin[c])
      )
      es[0].add(2*c+2)
      costs[0].add(
        abs(eCmax[c])+abs(eCmax[c]-eCmin[c])
      )
    else:
      es[2*(c-1)+1].add(2*c+1)
      costs[2*(c-1)+1].add(
        abs(eCmin[c]-eCmax[c-1])+abs(eCmax[c]-eCmin[c])
      )
      es[2*(c-1)+1].add(2*c+2)
      costs[2*(c-1)+1].add(
        abs(eCmax[c]-eCmax[c-1])+abs(eCmax[c]-eCmin[c])
      )
      es[2*(c-1)+2].add(2*c+1)
      costs[2*(c-1)+2].add(
        abs(eCmin[c]-eCmin[c-1])+abs(eCmax[c]-eCmin[c])
      )
      es[2*(c-1)+2].add(2*c+2)
      costs[2*(c-1)+2].add(
        abs(eCmax[c]-eCmin[c-1])+abs(eCmax[c]-eCmin[c])
      )
  es[2*(colNum-1)+1].add(colNum*2+1)
  costs[2*(colNum-1)+1].add(abs(eCmax[colNum-1]))
  es[2*(colNum-1)+2].add(colNum*2+1)
  costs[2*(colNum-1)+2].add(abs(eCmin[colNum-1]))
  #echo es
  var
    dist = newseqwith(colNum*2+2,int.high)
  
  proc dijkstra(s:int)=
    dist.fill(int.high.div(4))
    dist[s]=0
    var q = initHeapQueue[(int,int)]()
    q.push((0,s))
    while q.len>0:
      var
        (cost,p)=q.pop()
      if cost > dist[p]:
        continue
      for nidx in 0..<es[p].len:
        var
          nxt = es[p][nidx]
          cst = costs[p][nidx]
        if dist[nxt] > dist[p]+cst:
          dist[nxt] = dist[p]+cst
          q.push((dist[nxt],nxt))
  dijkstra(0)

  return dist[colNum*2+1]


  
echo solve()