import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
template `mod=`(x,y) = x = x.mod(y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')




proc solve():int=
  var 
    (n,m) = (scan(),scan())
    a = newseqwith(n,scan())
    v = newseqwith(15*10^5+1,0)
    idx = 0
  result = int.high.div(4)
  for i in 0..<m:
    v[a[i]]+=1
  while v[idx]!=0:
    idx+=1
  #echo v[0..5]
  #echo idx
  result.min=idx
  for i in 1..n-m:
    v[a[i-1]]-=1
    v[a[i+m-1]]+=1
    if v[a[i-1]]==0:
      idx=a[i-1]
    else:
      while v[idx]!=0:
        idx+=1
    #echo a[i..<i+m], v[0..5]
    result.min=idx



      
    


echo solve()