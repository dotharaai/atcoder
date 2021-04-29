import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve()=
  var
    N = scan()
  for h in 0..<3500:
    for n in 0..<3500:
      
      if (4*h*n-N*(n+h)) > 0 and  N*h*n mod (4*h*n-N*(n+h)) == 0:
        var w = N*h*n div (4*h*n-N*(n+h))
        echo fmt"{h} {n} {w}"
        return
  return 
  
    

    
  
solve()