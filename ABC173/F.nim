import strutils, algorithm, sequtils



let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s

proc read:int = get().parseInt


# どう進めても選択された2つが0,0になるときのみ失敗する

# 0,0,nなどの状態にしないためには
# 0,1,n-1の状態でBから引かない


proc isValid(s:string):bool=
  var c = 0
  for i in 0..<s.len:
    if s[i] == '(':
      c+=1
    else:
      c-=1
    if c<0:
      return false
  return true

  

proc solve(n:int):string=
  var s = newseq[string](n)
  var svalue = newseq[int](n)
  for i in 1..n:
    s[i-1] = stdin.readLine
    svalue[i-1] = s[i-1].count('(') - s[i-1].count(')')
  if not s.allIt(it.isValid):
    return "No"

    

  return



var
  n = read()


echo solve(n,a,b,c)