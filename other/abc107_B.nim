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


proc transpose(s: seq[seq[char]]): seq[seq[char]] =
  result = newSeq[seq[char]](s[0].len)
  for i in 0 .. < s[0].len:
    result[i] = newSeq[char](s.len)
    for j in 0 .. < s.len:
      result[i][j] = s[j][i]
      
proc solve()=
  var
    (h,w)=(scan(),scan())
    a = newseqwith(h,read().toseq)
    v = a.filterIt(it != newseqwith(w,'.')).toseq().transpose()
    vv = v.filterIt(it != newseqwith(v[0].len,'.')).transpose()
  
  echo vv.mapIt(it.join("")).join("\n")
  
  
      
  
    

    
  
solve()