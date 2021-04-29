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
    (n,k)=(scan(),scan())
    a = newseqwith(n,scan())
    d = 10^9+7  
    pn = newseqwith(n,0)
    qn = newseqwith(n,0)
  for i in 0..<n:
    pn[i] = a.filterIt(it<a[i]).len
    qn[i] = a[i+1..<n].filterIt(it<a[i]).len
  #echo pn
  #echo qn
  var t = ((k*(k-1)) div 2).mod(d)
  for i in 0..<n:
    result += (t*pn[i]).mod(d) + (qn[i]*k).mod(d)
    result.mod=d
    #echo result
  
  
    

    
  
echo solve()