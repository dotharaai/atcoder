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



proc solve()=
  var
    (n,m)=(scan(),scan())
    a = newseqwith(n,0)
    b = newseqwith(n,0)
    check = newseqwith(n,0)
    dist = newseqwith(n,int.high)
    c:int
    d:int
  for i in 0..<n:
    (a[i],b[i])=(scan(),scan())
  for i in 0..<m:
    (c,d)=(scan(),scan())
    for j in 0..<n:
      if(dist[j]>abs(c-a[j])+abs(d-b[j])):
        check[j]=i
        dist[j]=abs(c-a[j])+abs(d-b[j])

    
  for i in 0..<n:
    echo check[i]+1

  
  
    

    
  
solve()