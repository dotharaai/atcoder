import algorithm, macros, math, sequtils, strutils, tables
# import bitops, lenientops, deques,
#   heapqueue, sets, sugar


let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s
 
proc read:int = get().parseInt


proc isValid(s:string):bool=
  for i in 0..<s.len-1:
    if s[i] == '1' and s[i+1] == '1':
      return false
  return true
const D = 1E9.int+7

proc solve(h,w,k:int):int=
  # 幅wのあみだくじの1段で1..wから1..wに移るパターンの個数は計算可能
  # 
  var allValidRow: seq[string] = @[]
  for i in 0..<2^(w-1):
    if i.toBin(w-1).isValid:
      allValidRow.add(i.toBin(w-1))
  var fromLeft = newseqwith(w,0)
  var fromUp = newseqwith(w,0)
  var fromRight = newseqwith(w,0)
  for row in allValidRow:
    for col in 0..<w:
      if 0<col and col < w-1:
        if row[col-1] == '1':
          fromLeft[col]+=1
        elif row[col] == '1':
          fromRight[col]+=1
        else:
          fromUp[col]+=1
      elif col == 0:
        if row[col] == '1':
          fromRight[col]+=1
        else:
          fromUp[col]+=1
      elif col == w-1:
        if row[col-1] == '1':
          fromLeft[col]+=1
        else:
          fromUp[col]+=1

  var dp = newseqwith(h+1,newseqwith(w,0))
  dp[0][0] = 1
  for i in 1..h:
    for j in 0..<w:
      if 0 < j and j < w-1:
        dp[i][j] += (dp[i-1][j]*fromUp[j] + dp[i-1][j-1]*fromLeft[j] + dp[i-1][j+1]*fromRight[j]) mod D
      elif j == 0:
        dp[i][j] += (dp[i-1][j]*fromUp[j] + dp[i-1][j+1]*fromRight[j]) mod D 
      elif j == w-1:
        dp[i][j] += (dp[i-1][j]*fromUp[j] + dp[i-1][j-1]*fromLeft[j]) mod D
  return dp[h][k-1]


var nm = stdin.readLine.split.map(parseInt)

echo solve(nm[0],nm[1],nm[2])