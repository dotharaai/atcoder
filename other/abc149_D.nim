import algorithm, sequtils, strutils, math,tables, queues,macros



macro toTuple*(rhs: seq,cnt: static[int]): auto =
  let t = genSym(); result = quote do:(let `t` = `rhs`;())
  for i in 0..<cnt: result[0][1].add(quote do:`t`[`i`])

let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s
 
 
proc read:int = get().parseInt

const D = 1E9.int + 7

proc solve():int=
  var (n,k) = stdin.readline.split.map(parseInt).toTuple(2)
  var (r, s, p) = stdin.readline.split.map(parseInt).toTuple(3)
  var t = stdin.readline()
  for offset in 0..<k:
    # 0で勝つ:R点
    # 1で勝つ:S点
    # 2で勝つ:P点
    var need = 0
    while need*k < n - offset:
      need+=1
    var dp = newseqwith(need+1, newseqwith(3,0))
    var idx = 0
    while idx*k < n - offset:
      #echo (idx*k + offset)
      var hand = t[idx*k+offset]
      if hand == 'p':
        dp[idx+1][1]+=s
      if hand == 'r':
        dp[idx+1][2]+=p
      if hand == 's':
        dp[idx+1][0]+=r
      dp[idx+1][0] += max(dp[idx][1], dp[idx][2])
      dp[idx+1][1] += max(dp[idx][0], dp[idx][2])
      dp[idx+1][2] += max(dp[idx][1], dp[idx][0])
      idx+=1
    result += max(dp[need])


      




  






echo solve()