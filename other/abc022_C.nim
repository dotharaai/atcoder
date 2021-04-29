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
    (n,m) = (scan(),scan())
    conn = newseqwith(n,newseqwith(n,0))
    exst = newseqwith(n,newseqwith(n,false))
    cost = newseqwith(n,int.high)
  result=int.high
  for i in 0..<m:
    var (u,v,l) = (scan()-1,scan()-1,scan())
    conn[u][v]=l
    conn[v][u]=l
    exst[u][v]=true
    exst[v][u]=true
  
  for firstcity in 1..<n:
    if exst[0][firstcity]:
      cost.fill(int.high)
      cost[firstcity]=conn[0][firstcity]
      exst[0][firstcity] = false
      exst[firstcity][0]=false
      var q = initDeque[int]()
      q.addLast(firstcity)
      while q.len>0:
        var p = q.popFirst()
        for nxt in 0..<n:
          if exst[p][nxt] and cost[p]+conn[p][nxt]<cost[nxt]:
            cost[nxt]=cost[p]+conn[p][nxt]
            q.addLast(nxt)
      result.min=cost[0]
      exst[0][firstcity]=true
      exst[firstcity][0]=true

  if result==int.high:
    return -1
  else:
    return





    
    

  
echo solve()