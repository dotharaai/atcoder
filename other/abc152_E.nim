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
    a = newseqwith(n,scan())
    b = newseqwith(n,1)
    m = 1E9.int+7
    mx = a.max
    d = 2
  while d^2<=mx:
    while a.anyIt(it.mod(d)==0):
      for i in 0..<n:
        if a[i].mod(d)==0:
          a[i] = a[i].div(d)
        else:
          b[i]*=d
          b[i].mod=m
    d+=1
  var memo:seq[int] = @[]
  for i, v in a:
    if v>1 and v notin memo:
      for j in 0..<n:
        if i!=j and a[j].mod(v)!=0:
          b[j]*=v
          b[j].mod=m
      memo.add(v)
  result=(b.sum mod m)

  result.mod=m
  
    
    
  
echo solve()