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
    n = scan()
    t = newseqwith(n,scan())
    a = newseqwith(n,scan())
    maxh = newseqwith(n,0)
    fix = newseqwith(n,false)
    d = 1E9.int+7
  fix[0]=true
  fix[n-1]=true
  for i in 1..<n-1:
    if t[i-1]<t[i]:
      fix[i]=true
      if a[i]<t[i]:
        return 0
    if a[i]>a[i+1]:
      fix[i]=true
      if t[i]<a[i]:
        return 0
  if t[n-1]!=a[0]:
    return 0

  result = 1
  for i in 0..<n:
    maxh[i]=min(t[i],a[i])
  
  for i in 0..<n:
    if not fix[i]:
      result*=maxh[i]
      result.mod=d
  
    
  
echo solve()