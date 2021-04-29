import sequtils, math, strutils



proc isrunrun(n:string):bool=
  for i in 0..<n.len-1:
    if abs(($n[i]).parseInt - ($n[i+1]).parseInt) > 1:
      return false
  return true


proc find_runrun_num(k:int):seq[int]=
  for i in 1..k:
    if ($i).isrunrun:
      result.add(i)
  return 

const runrun_num:seq[int] = find_runrun_num(10^7)

echo runrun_num[stdin.readLine.parseInt-1]