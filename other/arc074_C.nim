import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
template `mod=`(x,y) = x = x mod y
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc scanf(): float = read().parseFloat
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve():int=
  var
    (h,w)=(scan(),scan())
    c1,c2,c3,c4:int
  # 縦三等分
  if h.mod(3)==0:
    c1=0
  else:
    c1=w
  # 横三等分
  if w.mod(3)==0:
    c2=0
  else:
    c2=h
  # 縦に切ってから横
  c3=h*w
  c4=h*w
  for i in 0..<w:
    var
      p1=h*i
      p2=(w-i)*(h.div(2))
      p3=(w-i)*(h.div(2)+h.mod(2))
    c3.min=(max(@[p1,p2,p3])-min(@[p1,p2,p3]))
  # 横に切ってから縦
  for i in 0..<h:
    var
      p1=w*i
      p2=(h-i)*(w.div(2))
      p3=(h-i)*(w.div(2)+w.mod(2))
    c4.min=(max(@[p1,p2,p3])-min(@[p1,p2,p3]))
  #echo @[c1,c2,c3,c4]
  return min(@[c1,c2,c3,c4])
  

  
    

    
  
echo solve()