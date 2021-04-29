import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques,heapqueue
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
    (n,m) = (scan(),scan())
    a = newseqwith(n,0)
    b = newseqwith(n,0)
    work = newseqwith(2E5.int,newseq[int]())
    q = initHeapQueue[int]()
    d = 1E6.int
  for i in 0..<n:
    (a[i],b[i])=(scan(),scan())
    work[a[i]].add(b[i])
  
  # 後ろから見るといいらしい。分からんかった　クソ
  for i in 1..m:
    for w in work[i]:
      q.push(d-w)
    if q.len>0:
      var w = d-q.pop
      result+=w




  
echo solve()