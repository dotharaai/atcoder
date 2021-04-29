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
    (N,W)=(scan(),scan())
    vs = newseqwith(4,newseq[int]())
    (w0,v0)=(scan(),scan())
  vs[0].add(v0)
  for i in 0..<N-1:
    var (w,v)=(scan(),scan())
    vs[w-w0].add(v)
  for i in 0..<4:
    vs[i].sort(SortOrder.Descending)
  
  for w1 in 0..vs[0].len:
    for w2 in 0..vs[1].len:
      for w3 in 0..vs[2].len:
        for w4 in 0..vs[3].len:
          if w1*w0+w2*(w0+1)+w3*(w0+2)+w4*(w0+3)<=W:
            result.max=(sum(vs[0][0..<w1])+sum(vs[1][0..<w2])+sum(vs[2][0..<w3])+sum(vs[3][0..<w4]))
      
          
echo solve()