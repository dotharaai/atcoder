import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
template `mod=`(x,y) = x = x mod y
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve():int=
  var
    (n,m)=(scan(),scan())
    p = newseqwith(n,scan())
    x = newseq[int](m)
    y = newseq[int](m)
    op = newseqwith(n,newseq[int](0))
    group = newseqwith(n,-1)
  p.applyIt(it-1)
  for i in 0..<m:
    (x[i],y[i])=(scan()-1,scan()-1)
    op[x[i]].add(y[i])
    op[y[i]].add(x[i])
  # 最大n個のグループが存在
  for g in 0..<n:
    if group[g] != -1:
      continue
    group[g]=g
    var q = initDeque[int]()
    q.addLast(g)
    while q.len>0:
      var p = q.popFirst()
      for next in op[p]:
        if group[next] == -1:
          group[next]=g
          q.addLast(next)
  var gi = newseqwith(n,initHashSet[int]())
  var gv = newseqwith(n,initHashSet[int]())
  for i, v in group:
    gi[v].incl(i)
    gv[v].incl(p[i])
  #echo group
  #echo gi
  #echo gv
  for idx in 0..<n:
    var ti = gi[idx]
    var tv = gv[idx]
    #echo ti
    #echo tv
    result+=len(ti.filterIt(it in tv))




  

  
    

    
  
echo solve()