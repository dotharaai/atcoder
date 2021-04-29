import strutils, algorithm, sequtils,strformat


let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s

proc read:int = get().parseInt

const modi = 998244353

const D = 998244353
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

proc solve(n,m,kmax:int):int=
  var m_minus_1_pow = 1
  for k in 0..<n-kmax-1:
    m_minus_1_pow = m_minus_1_pow*(m-1) mod modi
  for k in countdown(kmax,0):
    #echo fmt"{k}"
    result += m*(m_minus_1_pow*com(n-1,k)mod modi) mod modi
    m_minus_1_pow = m_minus_1_pow*(m-1) mod modi
  return result  mod modi



#


var
  n,mm,k = read()
cominit()
echo solve(n,mm,k)