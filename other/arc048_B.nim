import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
template `mod=`(x,y) = x = x mod y
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve()=
  var
    n = scan()
    players = newseqwith(n,(scan(),scan()-1))
    playerRank = newseqwith(100001,newseq[int](3))
    cumPlayerRank = newseqwith(100001,0)
  for p in players:
    playerRank[p[0]][p[1]]+=1
    cumPlayerRank[p[0]]+=1
  for i in 1..100000:
    cumPlayerRank[i]+=cumPlayerRank[i-1]
  for p in players:
    var
      win = cumPlayerRank[p[0]-1]+playerRank[p[0]][(p[1]+1).mod(3)]
      lose = cumPlayerRank[100000]-cumPlayerRank[p[0]]+playerRank[p[0]][(p[1]+2).mod(3)]
      draw = playerRank[p[0]][p[1]]-1
    echo fmt"{win} {lose} {draw}"
  
    

    
  
solve()