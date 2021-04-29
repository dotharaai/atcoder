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



proc solve():auto=
  var
    (n,m)=(scan(),scan())
    es = newseqwith(n,newseq[int]())
    cos = newseqwith(n,newseq[int]())
    visit = newseqwith(n,false)
    pos = newseqwith(n,0)
  for i in 0..<m:
    var(l,r,d)=(scan()-1,scan()-1,scan())
    es[l].add(r)
    cos[l].add(d)
    es[r].add(l)
    cos[r].add(-d)


  proc dfs(s:int):bool=
    if visit[s]:
      return true
    var q = initDeque[int]()
    q.addLast(s)
    while q.len>0:
      var p = q.popFirst()
      for nxt in 0..<es[p].len:
        var
          np = es[p][nxt]
        
        if not visit[np]:
          visit[np]=true
          pos[np]=pos[p]+cos[p][nxt]
          q.addLast(np)
        else:
          if pos[p]+cos[p][nxt] != pos[np]:
            return false
    return true
  
  for i in 0..<n:
    if not dfs(i):
      return "No"
  return "Yes"
  

  
echo solve()