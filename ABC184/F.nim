import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve()=
  var
    (n,t)=(scan(),scan())
    a = newseqwith(n,scan())
  proc make(ha:seq[int])=
    var dict = initTable[int,int]()
    dict[0]=0
    for v in ha:
      for k, val in dict.pairs():
        if k+v > t:
          continue
        if dict.hasKey(k+v):
          dict[k+v] = max(dict[k+v],val+v)
        else:
          dict[k+v]=val+v
    var v = 0
    dict.sortedByIt()
    for k, val in sort(dict).pairs():
      v.max=(val)
      





  # 親の初期化

  for i in 0..<n:
    par[i]=i
  



  
  
  

solve()