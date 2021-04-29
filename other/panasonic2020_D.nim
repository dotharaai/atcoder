import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
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
    q = initDeque[string]()
    c = "abcdefghijk"
  # i+1桁の標準形：
  # i桁の標準形の後ろにi桁の標準形に登場した文字種+1種の文字を付加したもの
  q.addLast("a")
  while q.len>0:
    var t = q.popFirst()
    if t.len>n:
      break
    if t.len==n:
      echo t
    else:
      q.addLast(t&"a")
      for i in 0..<10:
        if c[i] in t:
          q.addLast(t&c[i+1])
        
      
  
    


    
  
solve()