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
    (h,w,k)=(scan(),scan(),scan())
    chocolate = newseqwith(h,read()&"0")
  result = int.high
  for i in 0..<2^(h-1):
    var bl = i.toBin(h-1)
    var wch = newseqwith(bl.count('1')+1,newseq[int]())
    var wchc = newseqwith(bl.count('1')+1,0)
    var idx=0
    wch[0].add(0)
    for j in 1..<h:
      if bl[j-1]=='1':
        idx+=1
      wch[idx].add(j)
    #echo bl,", ", wch

    var cut = bl.count('1')
    var can = true
    for j in 0..<w:
      #echo chocolate[0][j] ,chocolate[1][j],chocolate[2][j]
      var nxt = newseqwith(bl.count('1')+1,0)
      for b in 0..<wchc.len:
        for id in wch[b]:
          if chocolate[id][j]=='1':
            nxt[b]+=1
      #echo nxt, ", ",nxt.anyIt(it>k)
      if nxt.anyIt(it>k):
        can=false
      var c = false
      for b in 0..<wchc.len:
        if nxt[b]+wchc[b]>k:
          c=true
        wchc[b]+=nxt[b]
      if c:
        cut+=1
        for b in 0..<wchc.len:
          wchc[b]=nxt[b]
    if can:
      result.min=cut



  
  
echo solve()