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



proc solve():int=
  var
    (n,m) = (scan(),scan())
    a = newseqwith(n,scan())
    combo = newseqwith(m,stdin.readline().split.map(parseInt))
  for i in 0..<2^n:
    var
      u = i.toBin(n)
      status:int=0
      bonus:int=0
    
    if u.count('1')!=9:
      continue
    for idx,idle in u: 
      if idle=='1':
        status+=a[idx]
    for com in combo:
      #echo com[2..<com[1]+2].mapIt(u[it-1]=='1')
      if com[2..<com[1]+2].mapIt(int(u[it-1]=='1')).sum>=3:
        #echo com[2..<com[1]+2]
        bonus+=com[0]
    #echo u, " => ",bonus, ", ", status
    result.max=(status+bonus)
    




    
  
echo solve()