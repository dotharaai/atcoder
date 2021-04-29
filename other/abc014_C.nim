import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
template `mod=`(x,y) = x = x mod y
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve():int=
  var
    n = scan()
    t = newseqwith(1000000+2,0)
  for i in 0..<n:
    var (a,b)=(scan(),scan())
    t[a]+=1
    t[b+1]-=1
  for i in 1..<1000000+1:
    t[i]=t[i-1]+t[i]
  return t.max()


    

    
  
echo solve()