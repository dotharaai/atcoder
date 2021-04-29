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
    edges = newseqwith(n,newseq[int]())
    cc = newseqwith(10^5+1,0)
    touched = newseqwith(n,false)
    goodv = newseq[int]()
  for i in 0..<n-1:
    var
      (a,b)=(scan()-1,scan()-1)
    edges[a].add(b)
    edges[b].add(a)

  proc dfs(p:int)=
    touched[p]=true
    if cc[c[p]] == 0:
      goodv.add(p+1)
    cc[c[p]]+=1
    for nxt in edges[p]:
      if not touched[nxt]:
        dfs(nxt)
    cc[c[p]]-=1
    return
  dfs(0)
  goodv.sort()
  echo goodv.join("\n")



solve()