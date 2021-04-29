import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
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
    (n,m,x,y)=(scan(),scan(),scan()-1,scan()-1)
    edges = newseqwith(n,newseq[int]())
    times = newseqwith(n,newseq[int]())
    departs = newseqwith(n,newseq[int]())
    arrive = newseqwith(n,int.high.div(2))

  for i in 0..<m:
    var (a,b,t,k)=(scan()-1,scan()-1,scan(),scan())
    edges[a].add(b)
    edges[b].add(a)
    times[a].add(t)
    times[b].add(t)
    departs[a].add(k)
    departs[b].add(k)

  proc dfs(x,y:int)=
    arrive[x]=0
    var q = initDeque[int]()
    q.addLast(x)
    while q.len>0:
      var p = q.popFirst()
      for i in 0..<edges[p].len:
        var
          nxt = edges[p][i]
          time = times[p][i]
          dep = departs[p][i]
        if arrive[p].mod(dep)==0:
          if arrive[nxt]>arrive[p] + time:
            arrive[nxt] = arrive[p] + time
            q.addLast(nxt)
        else:
          var loss = dep - arrive[p].mod(dep)
          if arrive[nxt]>arrive[p] + time + loss:
            arrive[nxt] = arrive[p] + time + loss
            q.addLast(nxt)
    return 
  dfs(x,y)
  if arrive[y]==int.high.div(2):
    return -1
  else:
    return arrive[y]
        


  


  

echo solve()