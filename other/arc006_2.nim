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
    n = scan()
    el = scan()
    stage = newseqwith(el,"| "&stdin.readLine&" |").reversed
    v = "  "&stdin.readLine()
    p = v.find("o")
  
  #echo v
  #echo stage.join("\n")
  #echo "\n"
  for s in stage:
    #echo s
    if s[p-1]=='-':
      p-=2    
    elif s[p+1]=='-':
      p+=2
    #echo p
  return p.div(2)
  
  
    

    
  
echo solve()