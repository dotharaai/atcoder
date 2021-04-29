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
    n  = scan()
    s1 = read()
    s2 = read()
    up = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    dw = "abcdefghijklmnopqrstuvwxyz"

  for i in 0..<n:
    if s1[i]!=s2[i]:
      if s1[i].isUpperAscii and s2[i].isUpperAscii:
        if s1[i]<s2[i]:
          s1 = s1.replace(s2[i],s1[i])
          s2 = s2.replace(s2[i],s1[i])
        else:
          s2 = s2.replace(s1[i],s2[i])
          s1 = s1.replace(s1[i],s2[i])
  #echo ""
  #echo s1
  #echo s2
  for i in 0..<n:
    if s1[i]!=s2[i]:
      if s1[i].isDigit and s2[i].isDigit:
        return 0
      elif s1[i].isDigit and s2[i].isUpperAscii:
        s1 = s1.replace(s2[i],s1[i])
        s2 = s2.replace(s2[i],s1[i])
      elif s2[i].isDigit and s1[i].isUpperAscii:
        s2 = s2.replace(s1[i],s2[i])
        s1 = s1.replace(s1[i],s2[i])
  #echo ""
  #echo s1
  #echo s2
  result = 1
  for i in 0..<n:
    if s1[i].isUpperAscii:
      s1 = s1.replace(s1[i],'x')
      if i==0:
        result*=9
      else:
        result*=10



    
    
  
echo solve()