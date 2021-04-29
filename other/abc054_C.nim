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
    (n,m)=(scan(),scan())
    conn = newseqwith(n,newseqwith(n,false))
    path = newseq[int](n-1)
  for i in 1..<n:
    path[i-1]=i

  for i in 0..<m:
    var (a,b) = (scan()-1,scan()-1)
    conn[a][b]=true
    conn[b][a]=true

  if zip(@[0]&path[0..<n-1],path).allIt(conn[it[0]][it[1]]):
    result+=1

  while path.nextPermutation():
    if zip(@[0]&path[0..<n-1],path).allIt(conn[it[0]][it[1]]):
      result+=1


  


    
  
echo solve()