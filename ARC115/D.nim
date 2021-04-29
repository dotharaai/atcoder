import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc scanf(): float = read().parseFloat
proc toInt(c:char): int =
    return int(c) - int('0')


proc solve():int=
  var
    (h,w,a,b)=(scan(),scan(),scan(),scan())
    shikiri = h*w*2-h-w
    pos = "0".repeat(shikiri-a) & "1".repeat(a)

  proc check(s:string):int=
    var
      tate = s[0..<(w-1)*h]
      yoko = s[(w-1)*h..<s.len]
    for i in 0..<tate.len:
      var
        row = i div (w-1)
        col = i mod (w-1)
      
      if tate[i]=='1':
        if col-1>=0 and tate[i-1]=='1':
          #echo "if1"
          return 0
        if col+1<=w-2 and tate[i+1]=='1':
          #echo "if2"
          return 0
        if row-1>=0 and yoko[(row-1)*w+col]=='1':
          #echo "if3"
          return 0
        if row-1>=0 and col+1 <= w-1 and yoko[(row-1)*w+col+1]=='1':
          #echo "if4"
          return 0
        if row<=h-2 and yoko[row*w+col]=='1':
          #echo "if5"
          return 0
        if row<=h-2 and yoko[row*w+col+1]=='1':
          #echo "if6"
          return 0

    # 横線
    for i in 0..<yoko.len:
      var
        row = i div (w)
        col = i mod (w)
      if yoko[i]=='1':
        if row-1>=0 and yoko[i-w]=='1':
          return 0
        if row+1<=h-2 and yoko[i+w]=='1':
          return 0
        if col-1>=0 and tate[row*(w-1)+col-1]=='1':
          return 0
        if col<=w-2 and tate[row*(w-1)+col]=='1':
          return 0
        if row+1<h-1 and col-1>=0 and tate[(row+1)*(w-1)+col-1]=='1':
          return 0
        if row+1<h-1 and col<=w-2 and tate[(row+1)*(w-1)+col]=='1':
          return 0
    return 1
  #echo pos, ":", check(pos)
  result = check(pos)
  while pos.nextPermutation():
    #echo pos,":",check(pos)
    result+=check(pos)
  
echo solve()