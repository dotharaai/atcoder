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



proc test(s:string):int=
  var t = "atcoder"
  if t<s:
    return 0
  if s.len>t.len and  s[0..<t.len] == t:
    return 0
  if s.allIt(it=='a'):
    return -1
  for i  in 0..<s.len:
    if s[i]!='a':
      
      if 't'<s[i]:
        return i-1
      else:
        return i
  
proc solve()=
  var
    t = scan()
  for i in 0..<t:
    echo test(read())
    

    
  
solve()