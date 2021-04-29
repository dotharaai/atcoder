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



proc solve():string=
  var
    s = read() & "T"
    (x,y)=(scan(),scan())
    m = newseq[int]()
    xm = newseq[int]()
    ym = newseq[int]()
    idx1 = 0
    idx2 = 0
    xset = initHashSet[int]()
    yset = initHashSet[int]()
  while idx1<s.len:
    idx2=idx1
    while idx2<s.len and s[idx2]=='F':
      idx2+=1
    m.add(idx2-idx1)
    idx1 = idx2 + 1
  for i,v in m:
    if i.mod(2)==0:
      xm.add(v)
    else:
      ym.add(v)
  #echo m
  #echo xm
  #echo ym
  if xm.len>0:
    xset.incl(xm[0])
  if ym.len>0:
    yset.incl(ym[0])
    yset.incl(-ym[0])
  else:
    yset.incl(0)
  if xm.len>1:
    for v in xm[1..<xm.len]:
      var t = initHashSet[int]()
      for vv in xset:
        t.incl(vv+v)
        t.incl(vv-v)
      xset = t
  if ym.len>1:
    for v in ym[1..<ym.len]:
      var t = initHashSet[int]()
      for vv in yset:
        t.incl(vv+v)
        t.incl(vv-v)
      yset=t
  if x in xset and y in yset:
    return "Yes"
  else:
    return "No"
  
    



  

  
echo solve()