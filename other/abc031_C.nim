import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve():int=
  result = -1000000
  var
    n = scan()
    a = newseqwith(n,scan())
  for i in 0..<n:
    var taoki = -1000000
    var tresult = -100000
    
    for j in 0..<n:
      if i==j:
        continue
      var
        t = a[min(i,j)..max(i,j)]
        s = t.foldr(a+b)
        aoki = 0
      
      for k in countup(1,t.len-1,2):#
        aoki+=t[k]
      if taoki < aoki:
        taoki = aoki
        tresult=s-aoki
      #echo t, ", ", aoki, ", ", s-aoki
    result.max=tresult
  return result
      
      

    

    
  
echo solve()