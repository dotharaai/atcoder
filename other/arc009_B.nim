import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')


proc rep(s:string,b:seq[string],c:seq[string]):string=
  result = s

  for idx in 0..9:
    result = result.replace(b[idx], c[idx])

proc solve()=
  var
    c = @["a","b","c","d","e","f","g","h","i","j"]
    b = newseqwith(10,$scan())
    n = scan()
    a = newseqwith(n,read().rep(b,c)).sorted(SortOrder.Ascending).mapIt(it.rep(c,b))
  for e in countup(1,9):
    for v in a.filterIt(it.len==e):
      echo v
  
  
  return
  
    

solve()