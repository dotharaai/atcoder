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
    (n,m) = (scan(),scan())
    box = newseqwith(n,false)
    boxc = newseqwith(n,1)
  box[0]=true
  for i in 0..<m:
    var (x,y)=(scan()-1,scan()-1)
    box[y] = box[y] or  box[x]
    boxc[x]-=1
    boxc[y]+=1
    if boxc[x]==0:
      box[x]=false
  return box.count(true)



  
    

    
  
echo solve()