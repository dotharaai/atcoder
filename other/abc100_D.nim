import algorithm, sequtils, strutils, math,tables, queues
let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s
 
proc read:int = get().parseInt


var ab:seq[int]


const inf = int.high div 2

proc doDP(n,m:int, x,y,z:var seq[int], pattern:int):int=
  var dp = newseqwith(m+1,newseqwith(n+1, -inf))
  var value = newseq[int](n)
  for i in 0..n:
    dp[0][i] = 0
  #for i in 0..m:
    #dp[i][0] = 0
  for i in 0..<n:
    if (pattern and 4) == 4:
      value[i] += x[i]
    else:
      value[i] -= x[i]
    if (pattern and 2) == 2:
      value[i] += y[i]
    else:
      value[i] -= y[i]
    if (pattern and 1) == 1:
      value[i] += z[i]
    else:
      value[i] -= z[i]

  #var t = value#
  #t.sort(system.cmp, SortOrder.Descending)

  for i in 1..m:
    for j in i..n:
      dp[i][j] = max(dp[i-1][j-1]+value[j-1],dp[i][j-1])
  #for d in dp:
    #echo d
  #echo pattern," ", dp[m][n], " ", t[0..<m].sum()
  return dp[m][n]








proc solve(n,m:int):int=
  # 綺麗さ/美味しさ/人気度
  # を+++/++-/+-+/...の8通りで試す
  # +-+のとき、ケーキiのスコアはx[i]-y[i]+z[i]
  var x = newseq[int](n)
  var y = newseq[int](n)
  var z = newseq[int](n)
  for i in 0..<n:
    var xyz = stdin.readline.split.map(parseInt)
    (x[i],y[i],z[i]) = (xyz[0],xyz[1],xyz[2])
  for i in  0..<8:
    result = max(result, doDP(n,m,x,y,z,i))


  return

ab = stdin.readline.split.map(parseInt)

echo solve(ab[0],ab[1])