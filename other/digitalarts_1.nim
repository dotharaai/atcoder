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



proc solve()=
  var
    s = stdin.readLine.split(" ")
    n = scan()
    t = newseqwith(n,read())

  proc f(s:string, c:string):string=
    if s.len!=c.len:
      return s
    else:
      for i in 0..<s.len:
        if c[i] != '*' and s[i]!=c[i]:
          return s
      return '*'.repeat(s.len)
  for c in t:
    s.applyIt(it.f(c))
  echo s.join(" ")
solve()