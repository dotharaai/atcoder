import algorithm, sequtils, strutils, math,tables, queues



let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s
 
 
proc read:int = get().parseInt


var
  D = 1E9.int+7
  m:int = 1E6.int
  fac:seq[int]
  finv:seq[int]
  inv:seq[int]
proc comInit()=
  fac = newseqwith(m,1)
  finv = newseqwith(m,1)
  inv = newseqwith(m,1)
  for i in 2..<m:
    fac[i] = fac[i-1]*i mod D
    inv[i] = D - inv[D mod i] * (D div i) mod D
    finv[i] = finv[i-1] * inv[i] mod D

proc com(n,k:int):int=
  if  n<k:return 0
  elif n<0 or k<0: return 0
  else:
    return fac[n] * (finv[k]*finv[n-k] mod D) mod D

proc H(n,r:int):int=
  return com(n+r-1,r)

comInit()


proc solve(x,y:int):int=
  if x.float / y.float > 2 or y.float / x.float > 2 or (x+y) mod 3 != 0:
    return 0
  # 端を(2a,a)とすると
  var a = (x+y) div 3
  for i in 0..a:
    if y == a+i:
      return com(a,i)




var x, y = read()

echo solve(x,y)