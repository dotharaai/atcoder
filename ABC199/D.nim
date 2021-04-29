import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
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
    color = newseqwith(n,0)
    footPrint = newseqwith(n,false)
    order = newseq[int]()
    g = newseqwith(n,newseqwith(n,false))

    
  for i in 0..<m:
    var
      (s,t)=(scan()-1,scan()-1)
    es[s].add(t)
    es[t].add(s)
    g[s][t] = true
    g[t][s] = true

  

  proc dfs(p:int)=
    footPrint[p]=true
    order.add(p)
    for nxt in 0..<n:
      if g[p][nxt] and not footPrint[nxt]:
        dfs(nxt)

  proc search(idx:int):int=
    if idx == order.len:
      return 1
    var p = order[idx]
    var h = initHashSet[int]()
    for s in 0..<idx:
      if g[order[s]][p]:
        h.incl(color[order[s]])
    for c in 1..3:
      if c notin h:
        color[p]=c
        result+=search(idx+1)

        




  result = 1
  for i in 0..<n:
    if not footPrint[i]:
      dfs(i)
      result*=search(0)
      order = newseq[int]()
  
  return
  


    
    
  
  

echo solve()