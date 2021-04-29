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
    c = read()
    n = c.len()
    p = initHashSet[int]()

    goal = initHashSet[int]()
    memo = initTable[HashSet[int],int]()
  for i in 0..<n:
    goal.incl(i)
    if c[i]=='o':
      p.incl(i)
  
  
  proc recSolve(last:HashSet[int]):int=
    if memo.hasKey(last):
      return memo[last]
    #echo last
    result=n
    if last==goal:
      return 0
    #for d in 0..<n:
    for d in countdown(n-1,0):
      if last + p.map(proc (x:int):int=(x+d).mod(n)) > last:
        result.min=(1+recSolve(last + p.map(proc (x:int):int=(x+d).mod(n))))
    memo[last] = result
      
  return recSolve(initHashSet[int]())







    

    
  
echo solve()