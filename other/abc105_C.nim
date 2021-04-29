import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')
var 
  d = 32
  lb = newseqwith(d,0)
  ub = newseqwith(d,0)

lb[0]=0
ub[0]=1
for i in 1..<d:
  var
    lw = 0
    up = 1
  for j in 0..<i:
    lw.min=lb[j]
    up.max=ub[j]
  if i.mod(2) == 0:
    lb[i] = lw+2^i
    ub[i] = up+2^i
  else:
    lb[i] = lw-2^i
    ub[i] = up-2^i






proc solve():string=
  var n = scan()
  if n == 0:
    return "0"
  result = "0".repeat(d)
  while n!=0:
    #echo n
    for i in 0..<d:
      if lb[i]<=n and n <= ub[i]:
        result[d-i-1] = '1'
        if i.mod(2) == 0:
          n -=  2^i
        else:
          n += 2^i
  result = result.strip(trailing=false,chars = {'0'})
  


    


    


echo solve()