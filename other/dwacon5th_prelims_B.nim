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
    (n,k)=(scan(),scan())
    a = newseqwith(n,scan())
    cuma = newseqwith(n+1,0)
    beauty = newseq[string]()
    maxv = a.sum()
    b = 1
  while 2^b<maxv:
    b+=1
  
  
  for i in 1..n:
    cuma[i]=cuma[i-1]+a[i-1]
  for x in 0..<n:
    for y in x+1..n:
      beauty.add((cuma[y]-cuma[x]).toBin(b))
  
  #for bea in beauty:
    #echo bea," : ", bea.fromBin[:int]()
  result=0
  for i in 0..<b:
    if beauty.filterIt(it[i]=='1').len>=k:
      # 要求桁がk個取れるなら取ったことにする
      beauty = beauty.filterIt(it[i]=='1')
      result+=2^(b-i-1)



  
  
    

    
  
echo solve()