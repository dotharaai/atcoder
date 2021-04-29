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



proc solve():string=
  var
    n = scan()
    s = n.toBin(100).strip(trailing=false,chars={'0'})
  
  if s.len==0:
    return "Aoki"
  
  if s.len.mod(2)==0:
    for i in 1..<s.len:
      if s[i]=='1' and i.mod(2)==1:
        return "Takahashi"
      if s[i]=='0' and i.mod(2)==0:
        return "Aoki"
    return "Takahashi"
  else:
    for i in 1..<s.len:
      if s[i]=='0' and i.mod(2)==1:
        return "Takahashi"
      if s[i]=='1' and i.mod(2)==0:
        return "Aoki"
    return "Aoki"




  

  
  
echo solve()