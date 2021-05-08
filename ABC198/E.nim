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



proc solve()=
  var 
    n = scan()
    c = newseqwith(n,scan())
    es = newseqwith(n,newseq[int]())
    goodv = newseq[int]()
    color = newseqwith(c.max()+1,0)
  for i in 0..<n-1:
    var
      (a,b) = (scan()-1,scan()-1)
    es[a].add(b)
    es[b].add(a)
  
  proc dfs(p:int,par:int)=
    color[c[p]]+=1
    if color[c[p]]==1:
      goodv.add(p+1)
    for nxt in es[p]:
      if par==nxt:
        continue
      dfs(nxt,p)
    color[c[p]]-=1
  dfs(0,-1)
  echo goodv.sorted.join("\n")



  


solve()