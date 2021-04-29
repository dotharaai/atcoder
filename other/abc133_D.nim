import algorithm, sequtils, strutils, math,tables, queues



let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s
 
 
proc read:int = get().parseInt
  
proc solve(n:int)=
  var dam = stdin.readLine.split.map(parseInt)
  var mt   = newseqwith(n,-1)
  var allmount = dam.sum() div 2
  # mt.0はdam[1]~[n-1]の偶数の物の合計を求めたりすると分かる
  var com = 0
  for idx in countup(2,n,2):
    com += dam[idx-1]
  #echo allmount
  #echo com
  mt[0] = (allmount-com) * 2
  for i in 1..<n:
    mt[i] = (dam[i-1]*2 - mt[i-1])
  for i in 0..<n-1:
    stdout.write(mt[i])
    stdout.write(" ")
  echo mt[n-1]
  



var n = read()

solve(n)