import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')


type Pref = object
  index:int
  birth:int


proc `<`(x,y:Pref):bool=
  x.birth<y.birth

proc solve()=
  var
    (n,m) = (scan(),scan())
    ps = newseqwith(n,newseq[Pref](0))

    
  for i in 0..<m:
    var (p, y) = (scan()-1,scan())
    ps[p].add(Pref(index:i, birth:y))
  ps.applyIt(it.sorted)
  var t = newseqwith(m,"")
  for idx, p in ps:
    for idx2, pp in p:
      t[pp.index]= fmt"{idx+1:06}{idx2+1:06}"
  echo t.join("\n")
    
  
solve()