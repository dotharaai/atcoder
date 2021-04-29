import strutils,algorithm, sequtils, math

let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s

proc read:int = get().parseInt

const D = (1E9+7).int
const m = 510000

var
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


proc solve(n,k:int):int=
  result = 1
  for i in 0..n-1:
    result =  result + com(n,k) * com(n-1,k-1) mod D
  echo result mod D
  return result
  




#var n,k = read()
cominit()
assert(com(10,2)==45,"combination test")
assert(com(10,3)==120,"combination test")
assert(solve(15,6)==22583772,"sample 3 failed")

#echo solve(n,k)