import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve():string=
  var
    s = read().reversed().join()
    idx=0
  while idx<s.len:
    if s[idx..<idx+5] == "esare":
      idx+=5
    elif s[idx..<idx+5]=="maerd":
      idx+=5
    elif s[idx..<idx+6]=="resare":
      idx+=6
    elif s[idx..<idx+7]=="remaerd":
      idx+=7
    else:
      return "NO"
  if idx==s.len:
    return "YES"
  else:
    return "NO"

  

    
  
echo solve()