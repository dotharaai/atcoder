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
    n = scan()
    m = scan()
    es = newseqwith(n,newseq[int]())
    k:int
    cs:seq[int]
  for i in 0..<m:
    var
      (a,b) = (scan()-1,scan()-1)
    es[a].add(b)
    es[b].add(a)
  k = scan()
  cs = newseqwith(k,scan()-1)

  # 各cから別のcへの最短距離だけ分かればいい

  var
    dist = newseqwith(k,newseqwith(n,int.high))
    dp = newseqwith(1 shl k,newseqwith(k,int.high.div(4)))


  proc dij(cidx,c:int)=
    var d:ptr seq[int] = dist[cidx].addr
    d[][c] = 0
    var q = initHeapQueue[(int,int)]()
    q.push((0,c))
    while q.len>0:
      var
        (cost,p) = q.pop()
      if cost > d[][p]:
        continue
      for nxt in es[p]:
        if d[][nxt] > d[][p]+1:
          d[][nxt] = d[][p]+1
          q.push((d[][nxt],nxt))
      

  
  for idx,c in cs:
    dij(idx,c)
    dp[1 shl idx][idx] = 1
  for idx, c in cs:
    if dist[0][c] == int.high:
      return -1
  #echo dist.join("\n")
  for mask in 1 ..< 1 shl k:
    for nidx,nc in cs:
      if (mask and (1 shl nidx)) == 0:
        for idx,c in cs:
          if (mask and (1 shl idx)) > 0:
            dp[mask + (1 shl nidx)][nidx].min=dist[idx][nc]+dp[mask][idx]
  #echo "_321"
  #for i in 0..<1 shl k:
    #echo i.toBin(k+1), " : ", dp[i]
  return dp[1 shl k - 1].min()

  


echo solve()