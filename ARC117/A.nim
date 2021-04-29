import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
template `mod=`(x,y) = x = x.mod(y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc scanf(): float = read().parseFloat
proc toInt(c:char): int =
    return int(c) - int('0')


proc solve()=
  var
    a = scan()
    b = scan()
    s = newseqwith(a+b,0)
  for i in 0..<a-1:
    #echo i
    s[i]=i+1
  for i in 0..<b-1:
    #echo i+(a-1)
    s[i+(a-1)]=(-1-i)
  #echo s.join(" ")
  var
    v = s.sum()
    lasta = 10^8 - v
    lastb = -(10^8)
  s[a+b-2]=lasta
  s[a+b-1]=lastb
  echo s.join(" ")
  #echo s.sum()
  

solve()