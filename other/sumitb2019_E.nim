import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')


const d = 1E9.int+7
proc solve():int=
  var
    n = scan()
    a = newseqwith(n,scan())
    x = newseqwith(n+1,0)
    y = newseqwith(n+1,0)
    z = newseqwith(n+1,0)
  for i in 0..<n:
    if x[i] == a[i]:
      x[i+1] = x[i]+1
      y[i+1] = y[i]
      z[i+1] = z[i]
    elif y[i] == a[i]:
      x[i+1] = x[i]
      y[i+1] = y[i]+1
      z[i+1] = z[i]
    elif z[i] == a[i]:
      x[i+1] = x[i]
      y[i+1] = y[i]
      z[i+1] = z[i]+1
    else:
      x[i+1] = x[i]+1
      y[i+1] = y[i]
      z[i+1] = z[i]

  result = 1
  
  for i in 0..<n:
    var t = (a[i]==x[i]).int+(a[i]==y[i]).int+(a[i]==z[i]).int
    result = result*t
    result = result.mod d
  
  
    

    
  
echo solve()