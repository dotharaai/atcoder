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



proc solve():string=
  var
    (h,w)=(scan(),scan())
    s = newseqwith(h,read())
    memo = newseqwith(1000,newseqwith(1000,-1))
  proc judge(x,y:int):int=
    if y>=h or x>=w or s[y][x]=='#':
      return 1
    if memo[x][y] != -1:
      return memo[x][y]
    result=0
    if judge(x+1,y)==0:
      result=1
    if judge(x+1,y+1)==0:
      result=1
    if judge(x,y+1)==0:
      result=1
    memo[x][y]=result
  var r = judge(0,0)
  if r==1:
    return "First"
  else:
    return "Second"
  
  
  
    

    
  
echo solve()