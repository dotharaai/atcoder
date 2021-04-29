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
    n = scan()
    a = newseqwith(n,scan())
    cuma = newseqwith(n,0)
    cumcuma = newseqwith(n,0)
    maxa = newseqwith(n,0)
  cuma[0]=a[0]
  cumcuma[0]=a[0]
  maxa[0]=a[0]
  result.max= a[0]
  for i in 1..<n:
    cuma[i] = cuma[i-1]+a[i]
    cumcuma[i] = cumcuma[i-1]+cuma[i]
    maxa[i] = max(maxa[i-1],cuma[i])
    result.max=(cumcuma[i-1]+maxa[i])
  #echo a
  #echo cuma
  #echo cumcuma
  #echo maxa


    
echo solve()