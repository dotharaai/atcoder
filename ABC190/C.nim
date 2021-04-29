import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques, heapqueue
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')




proc solve():int=
  var 
    (n,m)=(scan(),scan())
    ab = newseqwith(m,(scan()-1,scan()-1))
    k = scan()
    cd = newseqwith(k,(scan()-1,scan()-1))
  result = 0
  for i in 0..<2^k:
    var b = i.toBin(k)
    var dish = newseqwith(n,false)
    var r = 0
    for p in 0..<k:
      if b[p]=='0':
        dish[cd[p][0]] = dish[cd[p][0]] or true
      else:
        dish[cd[p][1]] = dish[cd[p][1]] or true
    for j in 0..<m:
      if dish[ab[j][0]] and dish[ab[j][1]]:
        r+=1
    result.max=r
  
    


    
  




  


  

    
  

  

echo  solve()