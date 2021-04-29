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



proc zAlgo(s:string):seq[int]=
  result = newseqwith(s.len,0)
  var
    i = 1
    j = 0
    k = 1
  while i < s.len:
    
    while i+j < s.len and s[j]==s[i+j]: j+=1
    result[i]=j
    if j==0:
      i+=1
      continue
    k = 1
    while i+k < s.len and k+result[k] < j:
      result[i+k] = result[k]
      k+=1
    i+=k
    j-=k



proc solve():int=
  var
    n = scan()
    s = read()
  for i in 0..<n:
    var a = zAlgo(s[i..<n])
    #echo a
    for j in 0..<n-i:
      if a[j]<=j:
        result.max=a[j]
  


echo solve()