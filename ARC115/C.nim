import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques, heapqueue
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')


proc solve()=
  var 
    n = scan()
    res = newseqwith(n+1,-1)
    edges = newseqwith(n+1,newseq[int]())

  for v in 1..n:
    var d = 2
    while v*d<=n:
      edges[v].add(v*d)
      d+=1
  
  proc dfs(x:int)=
    for nxt in edges[x]:
      if res[nxt] == -1:
        res[nxt]=res[x]+1
        dfs(nxt)
  res[1]=1
  dfs(1)
  echo res[1..n].join(" ")

    

solve()