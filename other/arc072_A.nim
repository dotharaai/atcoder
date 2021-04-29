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

  var pm=0
  var pmc = 0
  for i in 0..<n:
    if i.mod(2)==0:#先頭を+とする
      if pm+a[i]<=0:
        pmc+=1-(pm+a[i])
        pm = 1
      else:
        pm+=a[i]
    else:
      if pm+a[i]>=0:
        pmc+=1+(pm+a[i])
        pm = -1
      else:
        pm = pm+a[i]

  var mp=0
  var mpc = 0
  for i in 0..<n:
    if i.mod(2)==1:#先頭を-とする
      if mp+a[i]<=0:
        mpc+=1-(mp+a[i])
        mp = 1
      else:
        mp+=a[i]
    else:
      if mp+a[i]>=0:
        mpc+=1+(mp+a[i])
        mp = -1
      else:
        mp = mp+a[i]
  return min(pmc,mpc)
        

  
  
echo solve()