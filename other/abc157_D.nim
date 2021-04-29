import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')





proc solve()=
  var
    (n,m,k) = (scan(),scan(),scan())
    team = newseqwith(n,-1)
    connection = newseqwith(n,newseq[int]())
    blocks = newseqwith(n,newseq[int]())
    res = newseq[int]()

  
  for i in 0..<m:
    var (a,b) = (scan()-1,scan()-1)
    connection[a].add(b)
    connection[b].add(a)
  
  
  for idx,value in team:
    var q = initDeque[int]()
    if value == -1:
      q.addLast(idx)
      while q.len>0:
        var now = q.popFirst()
        team[now]=idx
        for next in connection[now]:
          if now!=next and team[next] == -1:
            q.addLast(next)
  for i in 0..<k:
    var (a,b) = (scan()-1,scan()-1)
    if team[a] == team[b]:
      blocks[a].add(b)
      blocks[b].add(a)
  var group = newseqwith(n,0)
  for i,v in team:
    group[v] += 1
  for i in 0..<n:
    var
      p = group[team[i]]
      r=p-connection[i].len-blocks[i].len-1
    res.add(r)
  echo res.join(" ")
    


    
  
    

    
  
solve()