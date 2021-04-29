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
    s1 = read()
    s2 = read()
    s3 = read()
    maxt = 0
    mint = 0
  for c in "abcdefghijklmnopqrstuvwxyz".toUpperAscii():
    if c in s3:
      var
        c1 = s1.count(c)
        c2 = s2.count(c)
        c3 = s3.count(c)
      maxt+=min(c1,c3)
      mint+=max(0,c3-c2)
  if mint*2<=s1.len and s1.len<=maxt*2:
    return "YES"
  else:
    return "NO"
      




    

    
  
echo solve()