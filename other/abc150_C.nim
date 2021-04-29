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
    p = newseqwith(n,scan())
    q = newseqwith(n,scan())
    a = 0
    b = 0
    t = newseqwith(n,0)
    tt = 1
  for i in 0..<n:
    t[i]=i+1
  if p==t:
    a=tt
  if q == t:
    b = tt
  while t.nextPermutation:
    tt+=1
    if p==t:
      a=tt
    if q == t:
      b = tt
  return abs(a-b)


  
  
  
  
  
    

    
  
echo solve()