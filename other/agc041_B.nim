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
    (n,m,v,p)=(scan(),scan(),scan(),scan())
    a = newseqwith(n,scan()).sorted(SortOrder.Descending)
    ca = newseqwith(n+1,0)
  for i in 0..<n:
    ca[i+1]=ca[i]+a[i]
  # i番目の問題が入りうるか
  for i in 0..<n:
    if a[i]>=a[p-1]:
      result+=1
    elif a[i]+m<a[p-1]:
      continue
    else:
      var r = 0
      r+=(n-i-1)*m
      r+=(p-1)*m
      r+=(a[i]+m)*(i-(p-1)) - (ca[i]-ca[p-1])
      if r >= m*(v-1):
        result+=1



echo solve()