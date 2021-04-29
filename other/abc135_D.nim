import algorithm, sequtils, strutils, math,tables, queues
let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s
 
proc read:int = get().parseInt


proc cmp(a,b:tuple[need,fin:int]):int=
  system.cmp[int](a.fin, b.fin)
const D = 1E9.int+7

# enough Array
proc solve(s:string):int=
  var n = s.len
  var s = "x" & s
  var dp = newseqwith(n+1, newseqwith(13,0))
  dp[0][0] = 1
  for idx in 1..n:
    if s[idx] == '?':
      for amari in 0..12:
        for v in 0..9:
          dp[idx][(amari*10+v) mod 13] += dp[idx-1][amari]
    else:
      var v = s[idx..idx].parseInt
      #echo "digit: ", v
      for amari in 0..12:
        #echo dp[idx-1][amari], ", ", $((amari*10+v) mod 13), "  => ", dp[idx-1][amari]
        dp[idx][(amari*10+v) mod 13] += dp[idx-1][amari]
    for amari in 0..12:
      dp[idx][amari] = dp[idx][amari] mod D
  #for d in dp:
    #echo d
  return dp[n][5]


      



  
  

var
  s = stdin.readLine

echo solve(s)