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
  var
    n = scan()
    y = newseqwith(366,false)
    mt = [0,31,29,31,30,31,30,31,31,30,31,30,31]
  for idx in 1..12:
    mt[idx]+=mt[idx-1]
  for i in countup(0,366,7):
    y[i] = true
  for i in countup(6,366,7):
    y[i] = true
  for i in 0..<n:
    var md = read().split("/").mapIt(it.parseInt)
    #echo md
    var days = mt[md[0] - 1] + md[1] - 1
    for i in days..<366:
      if y[i]:
        continue
      else:
        y[i]=true
        break
  var idx = 0
  #echo y
  while idx<366:
    if y[idx]:
      var i = 0
      while idx+i < 366 and y[idx+i]:
        i+=1
      result.max=i
      idx+=i
    else:
      idx+=1




  

  
    

    
  
echo solve()