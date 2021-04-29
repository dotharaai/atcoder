import strutils, algorithm, sequtils

const modier = (1E9+7).int

proc solve(N,K:int):int=
  var memo = newSeqWith(K+1,0)
  for i in countdown(K,1):
    memo[i]=1
    var p = K div i
    for j in 1..N:
      memo[i] *= p
      memo[i] = memo[i] mod modier
    var m = 2
    while m*i <= N:
      memo[i]-=memo[i*m]
      m+=1
#  echo memo
  for i,v in memo:
    result += i*v
    result = result.mod(modier)
  return result



var
  ab = stdin.readline().split(" ").mapIt(it.parseInt)

echo solve(ab[0],ab[1])