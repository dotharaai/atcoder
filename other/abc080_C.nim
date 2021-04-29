import algorithm, sequtils, strutils, math,tables





proc solve():int=
  var
    n = stdin.readline.parseint
    f = newseqwith(n,newseqwith(10,0))
    p = newseqwith(n,newseqwith(n,0))
  for i in 0..<n:
    var t = stdin.readline.split.map(parseInt)
    f[i] = t
  for i in 0..<n:
    var t = stdin.readline.split.map(parseInt)
    p[i] = t
  result = -int.high
  
  for i in 1..<2^10:
    var tresult = 0
    var t = i.toBin(10)
    
    for shop in 0..<n:
      var c = 0
      for j in 0..<10:
        if t[j] == '1' and f[shop][j] == 1:
          c+=1
      tresult+=p[shop][c]
    result = max(result, tresult)




  


  


echo solve()