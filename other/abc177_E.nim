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
    n = scan()
    a = newseqwith(n,scan())
    v = newseqwith(10^6+1,0)
    setw = a.foldl(gcd(a,b))==1
    pair = true
  
  for i in 0..<n:
    v[a[i]]+=1
  for i in 2..10^6:
    var c = 0
    for d in countup(i,10^6,i):
      c+=v[d]
    if c>1:
      pair=false
  if pair:
    return "pairwise coprime"
  if setw:
    return "setwise coprime"
  return "not coprime"
  
  
  

    
  
echo solve()