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
    (n,m,t)=(scan(),scan(),scan())
    a = newseqwith(n,scan())
    e = newseqwith(n,newseq[(int,int)]())
    ecos = newseqwith(n,int.high.div(2))
    inv = newseqwith(n,newseq[(int,int)]())
    invcos = newseqwith(n,int.high.div(2))


  for i in 0..<m:
    var (fr, to,cos) = (scan()-1,scan()-1,scan())
    e[fr].add((to,cos))
    inv[to].add((fr,cos))
  var q = initDeque[int]()
  q.addLast(0)
  ecos[0]=0
  invcos[0]=0
  while q.len>0:
    var p = q.popFirst()
    for (nxt,cost) in e[p]:
      if ecos[nxt] > ecos[p]+cost:
        ecos[nxt]=ecos[p]+cost
        q.addLast(nxt)



  q.addLast(0)
  while q.len>0:
    var p = q.popFirst()
    for (nxt,cost) in inv[p]:
      if invcos[nxt] > invcos[p]+cost:
        invcos[nxt]=invcos[p]+cost
        q.addLast(nxt)

  
  result = t*a[0]
  for i in 1..<n:
    result.max=max(0,t-invcos[i]-ecos[i])*a[i]






  
echo solve()