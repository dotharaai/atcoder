import strutils, sequtils, algorithm, math



proc solve():int=
  var
    hwk = stdin.readline.split.map(parseInt)
    (h,w,k) = (hwk[0],hwk[1],hwk[2])
    c = newseq[string](h)
  for i in 0..<h:
    c[i] = stdin.readLine
  for choicerow in 0..<2^h:
    for choicecol in 0..<2^w:
      var cr = choicerow.toBin(h)
      var cc = choicecol.toBin(w)
      var blacks = 0
      for row in 0..<h:
        for col in 0..<w:
          if c[row][col] == '#' and cr[row] == '0' and cc[col] == '0':
            blacks+=1
      if blacks==k:
        result+=1 




  
  
echo solve()