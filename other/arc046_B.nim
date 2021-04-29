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



proc solve():string=
  var
    n = scan()
    (a,b)=(scan(),scan())
  if n <= a:
    return "Takahashi"
  else:
    if a==b:
      if (n.mod(a+1))!=0:
        return "Takahashi"
      else:
        return "Aoki"
    else:
      if a>b:
        return "Takahashi"
      else:
        return "Aoki"
  

# A==Bのとき
# 
echo solve()