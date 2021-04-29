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



proc solve():string=
  var 
    (n,m) = (scan(),scan())
    a = newseqwith(n,scan())
    b = newseqwith(n,scan())
    edges = newseqwith(n,newseq[int](0))
    f = newseqwith(n,false)

  
  for i in 0..<m:
    var (c,d)=(scan()-1,scan()-1)
    edges[c].add(d)
    edges[d].add(c)
  
  for p in 0..<n:
    if f[p] == false:
      var
        q = initDeque[int]()
        asum=0
        bsum=0
      q.addLast(p)
      while q.len>0:
        var n = q.popFirst()
        f[n]=true
        asum+=a[n]
        bsum+=b[n]
        for next in edges[n]:
          if f[next]==false:
            q.addLast(next)
      if asum!=bsum:
        return "No"
  return "Yes"





echo solve()