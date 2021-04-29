import algorithm, sequtils, strutils, math,tables, strformat



let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s
 
proc read:int = get().parseInt



proc solveRec(s:var string, k:int, idx:int)=
  #echo fmt"{k}, {idx}"
  if k == 0:
    return
  if s.len == idx+1:
    var t = k
    while s[idx].int + t > 122:
      t -= 26
    s[idx] = (s[idx].int+t).chr
      
  else:
    if '{'.int - s[idx].int <= k and s[idx] != 'a':
      #echo fmt"{'{'.int}, {s[0].int}"
      solveRec(s, k - '{'.int  + int(s[idx]), idx+1)
      s[idx] = 'a'
    else:
      solveRec(s, k, idx+1)


proc solve():string=
  var
    s = stdin.readline
    k = stdin.readline.parseInt
  solveRec(s,k,0)
  return s
  


echo solve()