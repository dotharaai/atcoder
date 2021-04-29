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
    (h,w,k) = (scan(),scan(),scan())
    s = newseqwith(h,read())
    cut = newseqwith(h,newseq[int](w))
    blank = newseq[int](0)
    bq = initDeque[int]()
    usedc = 1
  for hidx, line in s:
    if '#' notin line:
      bq.addLast(hidx)
    
    else:
      #echo line
      var idx = 0
      while idx<w:
        var i = 0
        while idx+i < w and line[idx..idx+i].count("#")<2:
          i+=1
        i-=1
        #echo idx, ", ", i
        for j in 0..i:
          cut[hidx][idx+j] = usedc
        idx+=i+1
        usedc+=1






  while bq.len>0:
    var b = bq.popFirst()
    if b == 0:
      if b+1 in bq:
        bq.addLast(b)
      else:
        cut[b] = cut[b+1]
    elif b == h-1:
      if b-1 in bq:
        bq.addLast(b)
      else:
        cut[b] = cut[b-1]
    else:
      if b-1 in bq and b+1 in bq:
        bq.addLast(b)
      else:
        if b-1 notin bq:
          cut[b] = cut[b-1]
        else:
          cut[b] = cut[b+1]
  for c in cut:
    echo c.join(" ")

  return
    

    
  
solve()