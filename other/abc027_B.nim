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
    v = a.sum()
  if v.mod(n)!=0:
    return -1
  else:
    var
      p = v.div(n)
      x = 0
      y = 0
    while x<n:
      y = x
      var cum = a[x]
      while y<n and cum != p*(y-x+1):
        y+=1
        cum+=a[y]
      result+=y-x
      x=y+1
    
      

    

    
  
echo solve()