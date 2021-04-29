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
    (h,w,n) = (scan(),scan(),scan())
    (sh,sw) = (scan()-1,scan()-1)
    s = read()
    t = read()
    (nh,nw)=(sh,sw)
  # 上下左右に脱出できるケースをそれぞれ確認する
  # 1.高橋君は上方向を目指し、青木君は阻止しようとする
  #echo "up"
  for i in 0..<n:
    if s[i]=='U':
      if nh-1>=0:
        nh-=1
      else:
        return "NO"
    if t[i]=='D':
      if nh+1<h:
        nh+=1
  
  (nh,nw)=(sh,sw)
  #echo "down"
  # 2.高橋君は下方向を目指し、青木君は阻止しようとする
  for i in 0..<n:
    if s[i]=='D':
      if nh+1<h:
        nh+=1
      else:
        return "NO"
    if t[i]=='U':
      if nh-1>=0:
        nh-=1
  
  (nh,nw)=(sh,sw)
  #echo "right"
  # 3.高橋君は右方向を目指し、青木君は阻止しようとする
  for i in 0..<n:
    if s[i]=='R':
      if nw+1<w:
        nw+=1
      else:
        return "NO"
    if t[i]=='L':
      if nw-1>=0:
        nw-=1
  (nh,nw)=(sh,sw)
  # 4.高橋君は左方向を目指し、青木君は阻止しようとする
  #echo "left"
  for i in 0..<n:
    if s[i]=='L':
      if nw-1>=0:
        nw-=1
      else:
        return "NO"
    if t[i]=='R':
      if nw+1<w:
        nw+=1
  return "YES"
    

  
    

    
  
echo solve()