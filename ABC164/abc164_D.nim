import strutils, algorithm, sequtils, random

let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s

proc read:int = get().parseInt


const m = 2019



proc getMod(v,m:int):seq[int]=
  result = newseq[int](v+1)
  result[0] = 1
  for i in 1..<v:
    result[i] = (result[i-1]*10).mod(m)

  
const mods10:seq[int] = getMod(300000,m)

  
proc solve(s:string):int=
  var t = s.mapIt(it.ord - '0'.ord)
  var dp = newSeqWith(s.len+1, 0)
  dp[s.len]=0
  for i in countdown(s.len,1):
    dp[i-1] = (t[i-1]*mods10[s.len-i].mod(m)+dp[i]).mod(m)
  var memo = newseqwith[int](m,0)
  for i,v in dp:
    result+=memo[v]
    memo[v] += 1
  return

  

var
  s = stdin.readLine()

echo solve(s)