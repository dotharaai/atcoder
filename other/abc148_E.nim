import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')

proc f(n:int):int=
  if n < 2:
    return 1
  else:
    result = n*f(n-2)
    echo result
    for i in 0..<n:
      if result mod 10^i != 0:
        return result mod 10^i
    

proc solve():int=
  var n2 = scan()
  var n5 = n2
  #echo f(n5)
  if n2 mod 2 == 1:
    return 0
  else:
    var five = 0
    var pfive = 1
    n5 = n5 div 2
    while n5 >= 1:
      #echo n5
      five += (n5 div 5)
      n5 = n5 div 5
      pfive+=1
    
    result=five

  
    

#02,04,06,08,10 => 1
#12,14,16,18,20 => 1
#22,24,26,28,30 => 1
#32,34,36,38,40 => 1
#42,44,46,48,50 =>2  
#52,54,56,58,60 => 1   
#62,64,66,68,70 => 1 



echo solve()