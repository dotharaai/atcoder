import algorithm, sequtils, strutils, math,tables, queues



let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s
 
proc read:int = get().parseInt

# 根をKとした場合の距離を求める：O(n)
# 閉路がない＝ルートが１通りしかない

proc getCombination(n:int):seq[seq[int]]=
  result = newseqwith(n+1,newseqwith(n+1,1))
  for i in 0..n:
    result[i][i] = 1
    result[i][0] = 1
  for i in 1..n:
    for j in 1..<i:
      result[i][j] = result[i-1][j-1] + result[i-1][j]

const combination = getCombination(50)

var
  n,a,b = read()
  v = stdin.readLine.split.map(parseInt).sorted(system.cmp[int],SortOrder.Descending)
  maxavg = v[0..a-1].sum().float / a.float
  tailnum = v.filterit(it == v[a-1]).len
  takemin = (a-v.filterit(it>v[a-1]).len) # 取る最小個数
  takemax = min(v.filterit(it>=v[a-1]).len, b) - v.filterit(it>v[a-1]).len  # 取る最大個数


# もしもv[a-1] = v[0]ならいくつとっても良い
# そうでなければa個しか取らない


echo maxavg
var count = 0
if v[a-1] == v[0]:
  #echo takemin, "..", takemax
  for t in takemin..takemax:
    count+=combination[tailnum][t]
else:
  count = combination[tailnum][takemin]

echo count