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
    buka = newseqwith(n,newseq[int]())
  for i in 1..<n:
    var b = scan()-1
    buka[b].add(i)
  #echo buka
  proc calc(n:int):int=
    if buka[n].len==0:
      return 1
    else:
      var minn = int.high
      var maxx = 0
      for b in buka[n]:
        var  t = calc(b)
        minn.min=t
        maxx.max=t
      return (minn+maxx)+1
  return calc(0)
  
    

    
  
echo solve()