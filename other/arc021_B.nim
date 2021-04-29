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



proc solve()=
  var
    n = scan()
    b = newseqwith(n,scan())
    a = newseqwith(n,0)
  for i in 1..<n:
    a[i] = (a[i-1] xor b[i-1])
  if a[0] == (a[n-1] xor b[n-1]):
    for i in 0..<n:
      echo a[i]
  else:
    echo -1


    
  
solve()