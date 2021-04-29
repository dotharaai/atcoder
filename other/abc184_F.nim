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
    (n,t)=(scan(),scan())
    a0 = newseqwith((n+1).div(2),scan())
    a1 = newseqwith((n).div(2),scan())
    p0 = initHashSet[int]()
    p1 = initHashSet[int]()
  #echo a0
  #echo a1
  if n==1:
    if t>=a0[0]:
      return a0[0]
    else:
      return 0
  for i in 0..<2^a0.len:
    var
      b = i.toBin(a0.len)
      v = 0
    for j in 0..<a0.len:
      if b[j]=='1':
        v+=a0[j]
    p0.incl(v)
  for i in 0..<2^a1.len:
    var
      b = i.toBin(a1.len)
      v = 0
    for j in 0..<a1.len:
      if b[j]=='1':
        v+=a1[j]
    p1.incl(v)
  var
    s0 = p0.toSeq.sorted(SortOrder.Ascending)
    s1 = p1.toSeq.sorted(SortOrder.Descending)
    i0 = 0
    i1 = 0
  while i1<s1.len:
    while i0<s0.len and s1[i1]+s0[i0]<=t:
      result.max=(s0[i0]+s1[i1])
      i0+=1
    i1+=1


  


    
  
echo solve()