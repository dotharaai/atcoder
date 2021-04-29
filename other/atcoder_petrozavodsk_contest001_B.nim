import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets, critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')


# 直線に乗るボールが多い傾きを選ぶ
# 2点の選び方は50*49/2通りしかないから全部試して、それぞれコスト最小になる取り方を調べる


var par:seq[int]  

proc root(par:var seq[int], x:int):int=
  if par[x] == x:
    return x
  else:
    par[x] = root(par, par[x])
    result = par[x]

proc unite(par:var seq[int], x,y :int)=
  var
    rx = root(par,x)
    ry = root(par,y)
  if rx == ry:
    return
  else:
    par[rx] = ry

proc same(par:var seq[int], x,y:int):bool=
  return root(par,x) == root(par,y)


proc solve():int=
  var
    n  = scan()
    x = newseq[int](n)
    y = newseq[int](n)
  for i in 0..<n:
    (x[i],y[i]) = (scan(),scan())
  
  result = int.high div 4
  if n == 1:
    return 1
  for i in 0..<n:
    for j in 0..<n:
      if i==j:
        continue
      var
        c = 0
        p = x[j]-x[i]
        q = y[j]-y[i]
      for k in 0..<n:
        for l in 0..<n:
          if x[k]+p == x[l] and y[k]+q == y[l]:
            c+=1
      result.min=(n - c)
   
      

        

      
  
  
  


echo solve()