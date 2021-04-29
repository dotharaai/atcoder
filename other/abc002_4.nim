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
    (n,m)=(scan(),scan())
    neib = newseqwith(n,initHashSet[int]())
  for i in 0..<n:
    neib[i].incl(i)
  for i in 0..<m:
    var (x,y)=(scan()-1,scan()-1)
    neib[x].incl(y)
    neib[y].incl(x)
  for p in 0..<2^n:
    var b = p.toBin(n)
    var
      group = initHashSet[int]()
      nbs = initHashSet[int]()
    for i in 0..<n:
      nbs.incl(i)
    for i in 0..<n:
      if b[i]=='1':
        group.incl(i)
        nbs = nbs * neib[i]
    if nbs>=group:
      result.max=(b.count('1'))
    




    
  
echo solve()