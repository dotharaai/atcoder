import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve():int=
  var 
    (h ,w)= (scan(),scan())
    s = newseqwith(h,read()&"#") & @["#".repeat(w+1)]
  for i in 0..<h:
    for j in 0..<w:
      if s[i][j]=='.' and s[i][j+1]=='.':
        result+=1
      if s[i][j]=='.' and s[i+1][j]=='.':
        result+=1


echo solve()