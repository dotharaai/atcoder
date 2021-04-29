import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



var
    (h,w) = (scan(),scan())
    n = scan()
    a = newseqwith(n,scan())
    board = newseqwith(h,newseq[int](w))

proc move(px,py:var int)=
  if py.mod(2) == 0:
    px+=1
    if px==w:
      px-=1
      py+=1
  else:
    px-=1
    if px == -1:
      px+=1
      py+=1




proc solve()=
  
  var
    px = 0
    py = 0
  board[py][px] = 1
  a[0]-=1
  for aidx, av in a:
    for c in 0..<av:
      move(px,py)
      board[py][px] = aidx+1
  for b in board:
    echo b.join(" ")

  return
  
    

    
  
solve()