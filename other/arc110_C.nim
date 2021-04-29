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
    n = scan()
    p = newseqwith(n,scan()-1)
    goal = newseqwith(n,0)
    ip = newseqwith(n,0)
    log = newseq[int]()
  for i in 0..<n:
    ip[p[i]]=i
    goal[i]=i

  for i in 0..<n:
    if log.len>n-1:
      echo -1
      return
    if p[i]==i:
      continue
    for idx in countdown(ip[i],i+1):
      (p[idx],p[idx-1])=(p[idx-1],p[idx])
      log.add(idx)
    
  #echo p
  if p==goal and log.len == log.toHashSet.len and log.toHashSet.len==n-1:
    echo log.join("\n")
  else:
    echo -1



solve()