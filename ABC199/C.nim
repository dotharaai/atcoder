import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques, heapqueue
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')


proc solve()=
  var 
    n = scan()
    s = read()
    q = scan()
    tab = newseqwith(q,(scan(),scan()-1,scan()-1))
    ss = newseq[string](2)
    cond = false
  ss[0] = s[0..<n]
  ss[1] = s[n..<2*n]
  for (t,a,b) in tab:
    if t==1:
      if cond == false:#ss[0]が先頭
        if a<n and b<n:
          (ss[0][a],ss[0][b]) = (ss[0][b],ss[0][a])
        elif a<n and n<=b:
          (ss[0][a],ss[1][b-n]) = (ss[1][b-n],ss[0][a])
        elif n<=a and b<n:
          (ss[1][a-n],ss[0][b]) = (ss[0][b],ss[1][a-n])
        elif n<=a and n<=b:
          (ss[1][a-n],ss[1][b-n]) = (ss[1][b-n],ss[1][a-n])
      else:#ss[1]が先頭
        if a<n and b<n:
          (ss[1][a],ss[1][b]) = (ss[1][b],ss[1][a])
        elif a<n and n<=b:
          (ss[1][a],ss[0][b-n]) = (ss[0][b-n],ss[1][a])
        elif n<=a and b<n:
          (ss[0][a-n],ss[1][b]) = (ss[1][b],ss[0][a-n])
        elif n<=a and n<=b:
          (ss[0][a-n],ss[0][b-n]) = (ss[0][b-n],ss[0][a-n])
    else:
      cond = not cond
  if cond == false:
    echo ss[0] & ss[1]
  else:
    echo ss[1] & ss[0]

solve()