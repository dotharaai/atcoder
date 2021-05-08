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
    n = scan()
    a = newseqwith(n,scan())
    b = newseqwith(n,scan())
    acount = newseqwith(n+1,0)
    bcount = newseqwith(n+1,0)
    ca = newseqwith(n+1,0)
    cb = newseqwith(n+1,0)
  for i in 0..<n:
    acount[a[i]]+=1
    bcount[b[i]]+=1

  for i in 0..<n:
    ca[a[i]]+=1
    cb[b[i]]+=1
  #echo ae
  var
    maxd = 0
  for val in 1..n:
    ca[val] += ca[val-1]
    cb[val] += cb[val-1]
    maxd.max=ca[val]-cb[val-1]
  for val in 0..n:
    if acount[val]+bcount[val]>n:
      echo "No"
      return
  echo "Yes"
  #echo starte
  var
    resb = b & b
  echo resb[n-maxd..<n*2-maxd].join(" ")

  
  
  
discard solve()