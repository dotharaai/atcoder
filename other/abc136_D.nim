import algorithm, sequtils, strutils, math,tables, queues
let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s
 
proc read:int = get().parseInt


proc solve2(s:string)=
  var n = s.len
  var d = newseq[int](n)
  var rs = newseq[int](n)
  var idx = 0
  #echo "右方向"
  while idx+1 < n:
    #echo idx, ", ", s[idx..idx+1]
    if s[idx..idx+1] == "RL":
      var leng = 1
      while idx+leng < n and s[idx+leng] == 'L':
        d[idx+leng] = leng
        leng+=1
      idx+=leng
    else:
      idx+=1
  idx = n-2
  #echo "左方向"
  while idx > 0:
    
    if s[idx..idx+1] == "RL":
      #echo idx, ", ", s[idx..idx+1]
      var leng = 1
      while idx-leng >= 0 and s[idx-leng] == 'R':
        #echo idx-leng, ", ", d[idx-leng], ", ", leng
        d[idx-leng] = leng+1
        leng+=1
      idx-=leng
    else:
      idx-=1
  #echo "d:", d
  # 各マスについて折り返しまでd[idx]マス
  for idx, ch in s:

    # 左方向に進む
    if ch == 'L':
      # 終端まで偶数なら終端で終わり、終端まで奇数歩なら終端一歩手前で終わる
      if d[idx] mod 2 == 0:
        rs[idx-d[idx]] += 1
      else:
        rs[idx-d[idx]+1] += 1
    # 右方向に進む
    if ch == 'R':
      # 終端まで偶数なら終端で終わり、終端まで奇数歩なら終端一歩手前で終わる
      if d[idx] mod 2 == 0:
        rs[idx+d[idx]] += 1
      else:
        rs[idx+d[idx]-1] += 1
  for i in 0..<n-1:
    stdout.write($rs[i] & " ")
  echo rs[n-1]

# enough Array
proc solve(s:string)=
  var n = s.len
  var d = newseq[int](n)
  var rs = newseq[int](n)
  for idx, ch in s:
    if ch == 'L':
      var leng = 0
      while s[idx-leng]=='L':
        leng+=1
      d[idx] = leng
    else:
      var leng = 0
      while s[idx+leng]=='R':
        leng+=1
      d[idx] = leng
  #echo "d:", d
  # 各マスについて折り返しまでd[idx]マス
  for idx, ch in s:

    # 左方向に進む
    if ch == 'L':
      # 終端まで偶数なら終端で終わり、終端まで奇数歩なら終端一歩手前で終わる
      if d[idx] mod 2 == 0:
        rs[idx-d[idx]] += 1
      else:
        rs[idx-d[idx]+1] += 1
    # 右方向に進む
    if ch == 'R':
      # 終端まで偶数なら終端で終わり、終端まで奇数歩なら終端一歩手前で終わる
      if d[idx] mod 2 == 0:
        rs[idx+d[idx]] += 1
      else:
        rs[idx+d[idx]-1] += 1
  for i in 0..<n-1:
    stdout.write($rs[i] & " ")
  echo rs[n-1]

var
  s = stdin.readLine

#echo "first"
#solve(s)
#echo "second"
solve2(s)