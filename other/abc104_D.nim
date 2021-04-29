import algorithm, sequtils, strutils, math,tables, queues
let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s
 
proc read:int = get().parseInt


var s:string


const modi = 1E9.int+7


proc solve(s:string):int=
  var dp = newseqwith(s.len+1, newseqwith(4,0))
  dp[s.len][3] = 1
  for j in 0..2:
    dp[s.len][j] = 0
  for i in countdown(s.len-1,0):
    if s[i] == '?':
      dp[i][3] = (dp[i+1][3]*3) mod modi
    else:
      dp[i][3] = dp[i+1][3] mod modi
  #for i in countdown(s.len-1,0):
    for c in countdown(2,0):
      var m1, m2:int
      if s[i] == '?':
        m1 = 3
      else:
        m1 = 1
      if s[i] == "ABC"[c] or s[i] == '?':
        m2 = 1
      else:
        m2 = 0
      dp[i][c] = (m1 * dp[i+1][c] + m2 * dp[i+1][c+1]) mod modi


  return dp[0][0]

proc solve_wrong(s:string):int=
  # ?の個数をqとすると
  # A,B,Cが組み込みのやつ: A,B,Cの配置*3^q mod modi
  # A,B,Cのうち1つが?から採用: A,B,Cの配置パターン*3^(q-1) mod modi
  # A,B,Cのうち2つが?から採用: A,B,Cの配置パターン*3^(q-2) mod modi
  # A,B,Cのうち3つが?から採用: A,B,Cの配置パターン*3^(q-3) mod modi
  var dp = newseqwith(s.len+1,newseqwith(3+1,newseqwith(3+1,0)))
  # dp[cidx][abc][qUse]
  # 初期化
  var qnum = (@s).filterIt(it == '?').len
  for i in 0..s.len:
    dp[i][0][0] = 1
  for qUse in 0..3:
    for abc in 1..3:
      var search = @['A','B','C'][abc-1]
      for cidx in 1..s.len:
        var c = s[cidx-1]
        if qUse == 0:
          if c == search:
            dp[cidx][abc][qUse] = dp[cidx-1][abc-1][qUse] + dp[cidx-1][abc][qUse]
          else:
            dp[cidx][abc][qUse] = dp[cidx-1][abc][qUse]
        else:
          if c == search:
            dp[cidx][abc][qUse] = dp[cidx-1][abc-1][qUse] + dp[cidx-1][abc][qUse]
          elif c == '?':
            dp[cidx][abc][qUse] = dp[cidx-1][abc-1][qUse-1] + dp[cidx-1][abc-1][qUse]
          else:
            dp[cidx][abc][qUse] = dp[cidx-1][abc][qUse]
  for d in dp:
    for dpp in d:
      echo dpp
    echo ""
  #echo dp[s.len][3][0]
  #echo dp[s.len][3][1]
  #echo dp[s.len][3][2]
  #echo dp[s.len][3][3]
  echo "qnum:", qnum
  for qn in 0..min(3,qnum):
    echo qn, ", ", dp[s.len][3][qn]
    result += dp[s.len][3][qn]*(3^(qnum-qn)) mod modi
  return

#echo solve("ABCBC") ," exp 3"
#echo solve("A??C") ," exp 8"
#echo solve("????C?????B??????A???????") == 979596887
echo solve(stdin.readLine)