import algorithm, sequtils, strutils, math,tables, queues, macros


macro toTuple*(rhs: seq,cnt: static[int]): auto =
  let t = genSym(); result = quote do:(let `t` = `rhs`;())
  for i in 0..<cnt: result[0][1].add(quote do:`t`[`i`])
  

proc solve(n:int):int=
  var dp = newseqwith(10,newseqwith(10,0))
  for i in 1..n:
    var s = $i
    dp[(s[0].int-'0'.int)][i mod 10]+=1
  for i in 1..9:
    for j in 1..9:
      result+=(dp[i][j]*dp[j][i])






  



var
  n = stdin.readline.parseint
echo solve(n)