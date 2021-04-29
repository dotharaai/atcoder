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
    a = newseqwith(n,scan())
    #n = 1E5.int
    #a = newseqwith(n,0)
    minus = initTable[int,int]()
    plus = initTable[int,int]()
  for i in 0..<n:
    if minus.hasKeyOrPut(i-a[i],1):
      minus[i-a[i]]+=1
    #if plus.hasKeyOrPut(i+a[i],1):
      #plus[i+a[i]]+=1
  for i in 0..<n:
    if minus.haskey(a[i]+i):
      result+=minus[a[i]+i]
      if i-a[i] == a[i]+i:
        result-=1


    
  
echo solve()