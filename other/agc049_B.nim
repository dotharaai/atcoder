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
    s = read()
    t = read()
    one = initDeque[int]()
    v=0
  for i in 0..<n:
    if s[i]=='1':
      one.addLast(i)
  for i in 0..<n:
    #echo fmt"{i},{s},{one},{one.len}"
    if t[i]=='1' and s[i]!='1':
      if not (one.len>=1):
        echo -1
        return
      v+=one[0]-i
      s[one[0]]='0'
      s[i]='1'
      one.popFirst()
    elif t[i]=='0' and s[i]!='0':
      if not (one.len>=2):
        echo -1
        return
      one.popFirst()
      v+=one[0]-i
      s[one[0]]='0'
      s[i]='0'
      one.popFirst()
    elif t[i]=='1' and s[i]=='1':
      one.popFirst()
  echo v

    
  
solve()