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
    n = scan()
    x = scan()
    a = newseqwith(n,scan())
    create = newseqwith(n+1, newseqwith(n+1,initHashSet[int]()))
    dp = newseqwith(n+1,newseqwith(n+1,int.high.div(2)))





  
    
echo "prepare"
var dp = newseqwith(100,newseqwith((10^7)*100,0))
echo "prepared"

  
  
  
#solve()