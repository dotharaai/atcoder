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
    (n,C)=(scan(),scan())
    
    imos = initTable[int,int]()
    keys = initHashSet[int]()

    
  for i in 0..<n:
    var (a,b,c) = (scan(),scan(),scan())
    keys.incl(a)
    keys.incl(b+1)
    if imos.hasKeyOrPut(a,c):
      imos[a]+=c
    if imos.hasKeyOrPut(b+1,-c):
      imos[b+1]-=c
    

  
  var keysq =  keys.toSeq.sorted
  #echo keysq
  #echo keysq.mapit(imos[it])
  var cum = imos[keysq[0]]
  for i in 1..<keysq.len:
    #echo cum*(keysq[i]-keysq[i-1])
    result+=min(cum,C)*(keysq[i]-keysq[i-1])
    cum+=imos[keysq[i]]



    


  
  
    
  
echo solve()