import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve():int=
  var
    (n,k,m,r) = (scan(),scan(),scan(),scan())
    s = newseqwith(n-1,scan()).sorted(SortOrder.Descending)
  
  if r*k <= s[0..<min(s.len,k)].sum():
    return 0
  else:
    if 0<=r*k-s[0..<k-1].sum() and r*k-s[0..<k-1].sum() <= m:
      return r*k-s[0..<k-1].sum()
    else:
      return -1
  
echo solve()