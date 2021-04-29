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
    (n,d,a)=(scan(),2*scan(),scan())
    m = newseqwith(n,(scan(),scan(),0)).sorted()
  #echo m
  m.add((1E9.int,0,0))
  var
    x = 0
    y = 0 # 初めてぎんぎつねの攻撃が届かなくなる座標
  for x in 0..<n:
    #echo m
    if x>0:
      m[x][2] += m[x-1][2]
    m[x][1] += m[x][2]
    while y < n and m[x][0]+d>=m[y][0]:
      y+=1
    if m[x][1]<=0:continue
    var attack = (m[x][1]+a-1).div(a)
    #echo fmt"attack {attack} on {x}"
    result+=attack
    m[x][2]-=attack*a
    m[y][2]+=attack*a

  
  
  
echo solve()