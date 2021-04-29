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
    a = newseqwith(n,0)
    testimony1 = newseqwith(n,newseqwith(n,false))
    testimony2 = newseqwith(n,newseqwith(n,false))
  for i in 0..<n:
    a[i] = scan()
    for j in 0..<a[i]:
      var (x, y) = (scan()-1,scan())
      testimony1[i][x] = true
      testimony2[i][x] = y == 1
  for i in 0..2^n-1:
    var kindness = i.toBin(n)
    var t = kindness.count('1')
    block check:
      for j in 0..<n:
        if kindness[j] == '1':
            for k in 0..<n:
              if testimony1[j][k]:
                if kindness[k] == '1' and testimony2[j][k] == false:
                  t=0
                  break check
                elif kindness[k] == '0' and testimony2[j][k] == true:
                    t=0
                    break check
    result.max=t
    





  return
  
    

    
  
echo solve()