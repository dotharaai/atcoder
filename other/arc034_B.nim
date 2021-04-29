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
    d = 19
    t = newseq[int](0)
  # 
  # 1<=f(x)<=digit(x)*9<=9*18=162
  # f(x) in 1..162:
  #   x = n-f(x)
  for fx in countdown(d*9,1):
    #echo fx,", ", n-fx, " : ",n-fx>0 and ($(n-fx)).toSeq().mapIt(($it).parseInt).sum() == fx
    if n-fx <= n and n-fx>0 and n-fx>0 and ($(n-fx)).toSeq().mapIt(($it).parseInt).sum() == fx:
      t.add(n-fx)
  if t.len==0:
    echo 0
  else:
    echo t.len
    echo t.join("\n")



    

    
  
solve()