import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve():string=
  var
    (n,m) = (scan(),scan())
    a = newseqwith(n,read())
    b = newseqwith(m,read())
  for y in 0..n-m:
    for x in 0..n-m:
      #echo a[y..<y+m].mapIt(it[x..<x+m])
      if a[y..<y+m].mapIt(it[x..<x+m]) == b:
        return "Yes"
  return "No"
    
  
    

    
  
echo solve()