import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve():int=
  var 
    n = scan()
    s = read()
    wcount = newseqwith(n+1,0)
    wsum = 0
  for i in 1..n:
    wcount[i] = wcount[i-1]
    if s[i-1]=='W':
      wcount[i]+=1
  #echo wcount
  wsum = wcount[n] # wが全部でいくつあるか
  result=int.high div 5
  for index in 0..n:
    # indexまでにあるwの個数:=wleft
    # index+1~終端までのRの個数:=rright
    # 操作回数:indexより左のwをすべてRにする かつ index+1より右のRを全てWにする
    #
    var rright = (n-wsum)-(index-wcount[index])
    #echo index, ", ",wcount[index], ", ", rright
    result.min=(max(wcount[index],rright))


  

echo solve()