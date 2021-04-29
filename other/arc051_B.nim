import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc mygcd(a,b:int,count:int=0):(int,int)=
  if b == 0:
    return (a, count)
  else:
    return mygcd(b, a mod b,count+1)


#echo mygcd(24+18,24)
#echo mygcd(24,18)



proc solve()=
  var
    k = scan()
    a = 2
    b = 1
  for i in 1..<k:
    (a,b) = (a+b,a)
  echo a," ",b
  #echo mygcd(a,b)
  

  
  
  
solve()