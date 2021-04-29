import algorithm, sequtils,math, strutils


proc solve():int=
  var
    table = newseqwith(3,newseqwith(5,false))
  
  for i in 0..<2^15:
    var t = i.tobin(15)
    table = newseqwith(3,newseqwith(5,false))
    if t.count('1')<=6:
      for idx in 0..<15:
        if t[idx]=='1':
          table[idx div 5][idx mod 5] = not table[idx div 5][idx mod 5]
          if idx-5>=0:
            table[idx div 5 - 1][idx mod 5] = not table[idx div 5 - 1][idx mod 5]
          if idx+5<15:
            table[idx div 5 + 1][idx mod 5] = not table[idx div 5 + 1][idx mod 5]
          if idx mod 5 > 0:
            table[idx div 5][idx mod 5 - 1] = not table[idx div 5][idx mod 5 - 1]
          if idx mod 5  < 4:
            table[idx div 5][idx mod 5 + 1] = not table[idx div 5][idx mod 5 + 1]
      if table.allIt(it.allIt(it)):
        for idx in 0..<3:
          echo t[idx*5..<(idx+1)*5]
        for l in table:
          echo l



    
  

echo solve()