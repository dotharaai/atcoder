import algorithm, sequtils, strutils, math,tables, queues



let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s
 
 
proc read:int = get().parseInt

var
  fac:seq[int]
  finv:seq[int]
  inv:seq[int]

const D = 1E9.int+7
const m = 2E5.int + 10

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
    result = 1
    for i in 0..<k:
      result*=(n-i)
      result = result mod D
    return (result * finv[k] )mod D

proc H(n,r:int):int=
  return com(n+r-1,r)

comInit()

proc modPow(x,b,md:int):int=
  if b == 1:
    return x
  return (modPow((x^2) mod md, b div 2, md) * x^(b mod 2)) mod md


proc solve(n,a,b:int):int=
  result = modPow(2,n,D)
  result -= 1
  result -= com(n,a)+com(n,b)
  while result < 0:
    result += D



var n,a,b = read()
echo solve(n,a,b)