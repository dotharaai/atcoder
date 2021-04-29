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



proc solve()=
  var
    (n,c)=(scan(),scan())
    a = newseqwith(n,scan()-1)
    cnt = newseqwith(c,newseqwith(1,-1))
    ap = n + (n*(n-1)) div 2
  for i, v in a:
    cnt[v].add(i)
  for v in 0..<c:
    cnt[v].add(n)
    var exc = 0
    #echo v,", ", cnt[v]
    for i in 0..<cnt[v].len-1:
      var diff = cnt[v][i+1]-cnt[v][i] - 1
      #echo diff, ", ",(diff + ((diff*(diff-1)) div 2))
      exc+=(diff + ((diff*(diff-1)) div 2))
    echo ap - exc
  

  
solve()