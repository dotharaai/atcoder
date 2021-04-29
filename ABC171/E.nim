import algorithm, sequtils, strutils, math,tables,  macros, heapqueue



proc prepare()=
  var
    n = 20
    r = newseq[int](n)
    a = newseq[int](n)
  for i in 0..<n:
    r[i] = i*2 mod 17
  for i in 0..<n:
    for j in 0..<n:
      if i==j:
        continue
      else:
        a[i] = a[i] xor r[j]
  echo n
  echo a.join(" ")
  echo r.join(" ")



proc solve():string=
  var
    n = stdin.readline.parseInt
    a = stdin.readline.split.map(parseInt)
    r = newseq[int](n)
    zenbu = a.foldr(a xor b)
  for i in 0..<n:
    r[i] = zenbu xor a[i]
  return r.join(" ")
  


  

#prepare()
echo solve()