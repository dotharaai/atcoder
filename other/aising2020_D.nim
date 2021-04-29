import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
template `mod=`(x,y) = x = x mod y
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc popcount(x:string):int=
  return x.count('1')

proc calc(x:string,n:int):int=
  var m = 1
  for i in 0..<x.len:
    if x[x.len-1-i]=='1':
      result+=m
    m*=2
    m = m.mod(n)
    result = result.mod(n)
  result = result.mod(n)
    



proc popcount(x:int):int=
  var
    x = x
  while x>=1:
    result+=x.mod(2)
    x = x.div(2)
  return


proc f(x:int):int=
  if x == 0:
    return 0
  else:
    return 1+f(x.mod(popcount(x)))

proc f(x:string):int=
  if x == '0'.repeat(x.len):
    return 0
  else:
    return 1 + f(calc(x,x.popcount))
  

proc solve()=
  var
    n = scan()
    x = read()
    y:string
    originp = x.popcount
    originp_m1:int
    originp_p1:int
    m2 = newseq[int](n)
    p2 = newseq[int](n)
  if originp != 1:
    originp_m1 = calc(x,originp-1)
  originp_p1 = calc(x,originp+1)
  m2[0]=1
  p2[0]=1
  for i in 1..<n:
    p2[i]=(p2[i-1]*2).mod(originp+1)
    if originp_m1>0:
      m2[i]=(m2[i-1]*2).mod(originp-1)


  for i in 0..<n:
    if x[i]=='1':
      if originp-1>0:
        var v = ((originp_m1-m2[x.len-1-i])+(originp-1)).mod(originp-1)
        echo 1+f(v)
      else:
        echo 0

    else:
      var v = ((originp_p1+p2[x.len-1-i])+(originp+1)).mod(originp+1)
      echo 1+f(v)
    
  

  
    

    
  
solve()