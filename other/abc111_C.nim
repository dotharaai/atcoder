import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')


proc cmp(x,y:(int,int)):int=
  return x[1]-y[1]

proc solve():int=
  var
    n = scan()
    v = newseqwith(n,scan())
    o = initOrderedTable[int,int]()
    e = initOrderedTable[int,int]()
  for idx,val in v:
    if idx mod 2 == 0:
      if e.hasKeyOrPut(val,1):
        e[val]+=1
    else:
      if o.hasKeyOrPut(val,1):
        o[val]+=1
  o.sort(cmp,SortOrder.Descending)
  e.sort(cmp,SortOrder.Descending)
  var ok = newseq[int](0)
  var ov = newseq[int](0)
  var ek = newseq[int](0)
  var ev = newseq[int](0)
  for key,value in o.pairs:
    ok.add(key)
    ov.add(value)
  for key, value in e.pairs:
    ek.add(key)
    ev.add(value)
  result = 1E6.int
  for oidx in 0..<ok.len:
    for eidx in 0..<ek.len:
      if ok[oidx] != ek[eidx]:
        result.min=n-(ov[oidx]+ev[eidx])
        break
  if result == 1E6.int:
    return n div 2
  
  
  
echo solve()