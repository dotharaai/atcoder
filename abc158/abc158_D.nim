import sequtils, strutils, algorithm,lists



proc solve():string=
  var s = initDoublyLinkedList[string]()
  for c in stdin.readline():
    s.append($c)
  var
    qnum = stdin.readline().parseInt()
    l_r = true
  for i in 0..<qnum:
    var query = stdin.readline().split(" ")
    if query[0]=="1":
      l_r = not l_r
    else:
      if l_r:
        if query[1]=="1":
          s.prepend(query[2])
        else:
          s.append(query[2])
      else:# 
        if query[1]=="1":
          s.append(query[2])
        else:
          s.prepend(query[2])
  result=""
  for i in s:
    result &= i
  if not l_r:
    result = (@result).mapIt($it).reversed().join()
  return


echo solve()