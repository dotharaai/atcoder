import strutils, algorithm, sequtils



let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s

proc read:int = get().parseInt


# どう進めても選択された2つが0,0になるときのみ失敗する

# 0,0,nなどの状態にしないためには
# 0,1,n-1の状態でBから引かない

  

proc solve(n,a,b,c:int):string=
  var orders = newseq[string](0)
  var sequence = newseq[string](0)
  var
    a = a
    b = b
    c = c
  for i in 0..<n:
    orders.add(stdin.readline)

  for idx, order in orders:
    if order == "AB":
      if a >= b:
        b+=1
        a-=1
        sequence.add("B")
      else:
        b-=1
        a+=1
        sequence.add("A")
    if order == "BC":
      if b >= c:
        c+=1
        b-=1
        sequence.add("C")
      else:
        c-=1
        b+=1
        sequence.add("B")
    if order == "CA":
      if c >= a:
        a+=1
        b-=1
        sequence.add("A")
      else:
        a-=1
        b+=1
        sequence.add("B")

  return



var
  n,a,b,c = read()


echo solve(n,a,b,c)