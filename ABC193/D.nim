import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc scanf(): float = read().parseFloat
proc toInt(c:char): int =
    return int(c) - int('0')


proc solve():float=
  var
    k = scan()
    s = read()
    t = read()
    last = newseqwith(10,0)
    prob = newseqwith(10,newseqwith(10,0.0))
  
  for i in 1..9:
    last[i] = k - s.count($i) - t.count($i)

  proc calc(h:string):int=
    for i in 1..9:
      result+=(10^h.count($i))*i
    return

  for i in 1..9:
    for j in 1..9:
      if i==j:
        prob[i][j] = (last[i].toFloat/last.sum().toFloat)*((last[j]-1).toFloat/(last.sum()-1).toFloat)
      else:
        prob[i][j] = (last[i].toFloat/last.sum().toFloat)*((last[j]).toFloat/(last.sum()-1).toFloat)


  #for p in prob:
    #echo p
  # 最後の一枚が1~9のケースそれぞれ
  for takahashi in 1..9:
    var takaval = calc(s & $takahashi)
    for aoki in 1..9:
      var aokival = calc(t & $aoki)
      #echo s & $takahashi
      #echo t & $aoki
      #echo takaval, ", ", aokival, ", ", takaval > aokival
      if takaval > aokival:
        result+=prob[takahashi][aoki]
    


    
echo solve()