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
    (n,m) = (scan(),scan())
    stages = newseqwith(n,read())
    stage = newseqwith(n,newseq[int](m))
    done = newseqwith(n,newseqwith(m,false))
    before = newseqwith(n,newseq[int](m))
  for i in 0..<n:
    for j in 0..<m:
      stage[i][j] = stages[i][j].toInt
  
  for i in 0..<n:
    for j in 0..<m:
      if stage[i][j] > 0:
        
        before[i+1][j] += stage[i][j]
        stage[i+2][j] -= stage[i][j]
        stage[i+1][j+1] -= stage[i][j]
        stage[i+1][j-1] -= stage[i][j]
        stage[i][j] = 0
  
  for b in before:
    echo b.join("")


  
  
    

    
  
solve()