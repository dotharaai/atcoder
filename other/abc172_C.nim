import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets, critbits, future, strformat
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve():int=
  var
    (n,m,k) = (scan(),scan(),scan())
    a = newseqwith(n,scan())
    acum = newseqwith(n+1,0)
    b = newseqwith(m,scan())
    bcum = newseqwith(m+1,0)
  for i in 0..<n:
    acum[i+1] = acum[i]+a[i]
  for i in 0..<m:
    bcum[i+1] = bcum[i]+b[i]
  var
    amax = 0
    bmax = 0
  while amax < n and acum[amax+1]<=k:
    amax+=1
  for alim in countdown(amax,0):
    while bmax < m and bcum[bmax+1]+acum[alim]<=k:
      bmax+=1
    result = max(result, alim+bmax)





echo solve()