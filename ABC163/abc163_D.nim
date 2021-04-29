import strutils, algorithm, sequtils, random

let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s

proc read:int = get().parseInt


var
  fac:seq[int]
  finv:seq[int]
  inv:seq[int]
const D:int = 1E9.int+7
const m = 510000

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



proc solve(N,K:int):int=
  # K個以上
  for use in K..(N+1):
    result += com(N+1,use).mod(D)
  return


var
  N,K = read()

cominit()

#echo S
#echo naivesolve(N,S)

echo solve(N,K)