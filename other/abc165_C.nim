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
    (n,m,q) = (scan(), scan(), scan())
    a = newseq[int](q)
    b = newseq[int](q)
    c = newseq[int](q)
    d = newseq[int](q)
    sq = newseqwith(n,1)
  for i in 0..<q:
    (a[i],b[i],c[i],d[i]) = (scan(), scan(), scan(), scan())
  proc next():bool=
    for i in countdown(n-1,0):
      if sq[i] < m:
        sq[i]+=1
        for j in i+1..<n:
          sq[j]=sq[i]
        return true
    return false
  proc score():int=
    for que in 0..<q:
      if sq[b[que]-1]-sq[a[que]-1]==c[que]:
        result+=d[que]
  sq[n-1]=0
  while next():
    result.max=score()
    


    

    
  
echo solve()