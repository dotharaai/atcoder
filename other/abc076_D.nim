import algorithm, sequtils, strutils, math,tables, queues



let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s
 
proc read:int = get().parseInt

const inf = int.high
var
  n = read()
  m = 8
  t = stdin.readLine.split.mapit(it.parseInt*m)
  v = stdin.readLine.split.mapIt(it.parseInt*m)

proc sectionv(st, tl, vl, j:int):int=
  if j < st:
    return st - j + vl
  elif j <= st+tl:
    return vl
  else:
    return j -  (st+tl) + vl

proc solve():float=
  # 各区間t_iでt_iより前はy=-xで制限速度が低下し、
  # t_iより後はy=xで制限速度が上昇していくイメージ
  # 全体の関数を重ね合わせて背最小値を取る
  var movetime = t.sum()
  var limitvelocity = newseq[int](movetime+1)
  for i in 0..movetime:
    limitvelocity[i] =  i
  for i in 0..movetime:
    limitvelocity[i] = min(limitvelocity[i], movetime - i)
  var st = 0
  for section in 0..<n:
    for j in 0..movetime:
      limitvelocity[j] = min(limitvelocity[j], sectionv(st, t[section],v[section],j))
    st+=t[section]

  return limitvelocity.sum.float / ((m.float)*(m.float))

echo solve()
