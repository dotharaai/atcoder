import sequtils, tables, math, macros, strutils


macro toTuple*(rhs: seq,cnt: static[int]): auto =
  let t = genSym(); result = quote do:(let `t` = `rhs`;())
  for i in 0..<cnt: result[0][1].add(quote do:`t`[`i`])


proc solve3():int=
  # 左下のk*kとその右のk*kに分割する
  var
    (n, k) = stdin.readline.split.map(parseint).toTuple(2)
    w = 2*k
    leftW = newseqwith(k,newseqwith(k,0))
    leftB = newseqwith(k,newseqwith(k,0))
    rightW = newseqwith(k,newseqwith(k,0))
    rightB = newseqwith(k,newseqwith(k,0))
    cumLeftW = newseqwith(k+1,newseqwith(k+1,0))
    cumLeftB = newseqwith(k+1,newseqwith(k+1,0))
    cumRightW = newseqwith(k+1,newseqwith(k+1,0))
    cumRightB = newseqwith(k+1,newseqwith(k+1,0))
  for i in 0..<n:
    var
      xyc = stdin.readline.split
      x = xyc[0].parseint mod w
      y = xyc[1].parseint mod w
      c = xyc[2]
    if (x < k and y < k) or (k <= x and k <= y):
      x = x mod k
      y = y mod k
      if c == "W":
        leftW[x][y] += 1
      elif c == "B":
        leftB[x][y] += 1
    elif (x < k and k <= y) or (k <= x and y < k):
      x = x mod k
      y = y mod k
      if c == "W":
        rightW[x][y] += 1
      elif c == "B":
        rightB[x][y] += 1

  for i in 0..<k:
    for j in 0..<k:
      cumLeftB[i+1][j+1] = cumLeftB[i+1][j] +  leftB[i][j]
      cumLeftW[i+1][j+1] = cumLeftW[i+1][j] +  leftW[i][j]
      cumRightB[i+1][j+1] = cumRightB[i+1][j] +  rightB[i][j]
      cumRightW[i+1][j+1] = cumRightW[i+1][j] +  rightW[i][j]
      
  for i in 0..<k:
    for j in 0..<k:
      cumLeftB[i+1][j+1] += cumLeftB[i][j+1]
      cumLeftW[i+1][j+1] += cumLeftW[i][j+1]
      cumRightB[i+1][j+1] += cumRightB[i][j+1]
      cumRightW[i+1][j+1] += cumRightW[i][j+1]
  for c in cumLeftB:
    echo c
  echo ""
  for c in cumLeftW:
    echo c
  echo ""
  for c in cumRightB:
    echo c
  echo ""
  for c in cumRightW:
    echo c
  echo ""
  var
    wnum:int
    bnum:int
  for i in 1..k:
    for j in 1..k:
      wnum = cumLeftW[i][j] + cumLeftW[0][0] - cumLeftW[i][0] - cumLeftW[0][j] 
      wnum += cumRightW[i][k] + cumRightW[0][j] - cumRightW[i][j] - cumRightW[0][k]
      bnum = cumRightB[i][j] + cumRightB[0][0] - cumRightB[i][0] - cumRightB[0][j] 
      bnum+=cumLeftB[i][k] + cumLeftB[0][j] - cumLeftB[i][j] - cumLeftB[0][k]
      result = max(result, wnum+bnum)

      


proc solve2():int=
  # 3k*3kに圧縮したバージョン(MLE)
  var
    (n, k) = stdin.readline.split.map(parseint).toTuple(2)
    w = 2*k
    black = newseqwith(w*2,newseqwith(w*2,0))
    white = newseqwith(w*2,newseqwith(w*2,0))
    cumBlack = newseqwith(w*2+1,newseqwith(1+w*2,0))
    cumWhite = newseqwith(w*2+1,newseqwith(1+w*2,0))
  for i in 0..<n:
    var
      xyc = stdin.readline.split
      x = xyc[0].parseint mod w
      y = xyc[1].parseint mod w
      c = xyc[2]
    if c == "W":
      white[x][y] += 1
      white[x+w][y] += 1
      white[x+w][y+w] += 1
      white[x][y+w] += 1
    else:
      black[x][y] += 1
      black[x+w][y] += 1
      black[x+w][y+w] += 1
      black[x][y+w] += 1
  for i in 0..<2*w:
    for j in 0..<2*w:
      cumBlack[i+1][j+1] = cumBlack[i+1][j] +  black[i][j]
      cumWhite[i+1][j+1] = cumWhite[i+1][j]  + white[i][j]
  for i in 0..<2*w:
    for j in 0..<2*w:
      cumBlack[i+1][j+1] += cumBlack[i][j+1]
      cumWhite[i+1][j+1] += cumWhite[i][j+1]
  
  # 縦横2回ずつ繰り返す
  var
    wnum = 0
    bnum = 0
  for i in k+1..k+w:
    for j in k+1..k+w:
      #echo "(i, j) = (", i, ", " ,j,")"
      #echo "(i-k-1, j-k-1) = (", i-k-1, ", " ,j-k-1,")"
      wnum = cumWhite[i][j] + cumWhite[i-k][j-k] - cumWhite[i][j-k] - cumWhite[i-k][j]
      wnum += cumWhite[i+k][j+k] + cumWhite[i][j] - cumWhite[i+k][j] - cumWhite[i][j+k]
      bnum  = cumBlack[i+k][j] + cumBlack[i][j-k] - cumBlack[i+k][j-k] - cumBlack[i][j]
      bnum  += cumBlack[i][j+k] + cumBlack[i-k][j] - cumBlack[i-k][j+k] - cumBlack[i][j]
      #echo "(wnum, bnum) = (", wnum,  ", ", bnum, ")"
      result = max(result, wnum+bnum)


proc solve():int=
  var
    (n, k) = stdin.readline.split.map(parseint).toTuple(2)
    w = 2*k
    black = newseqwith(w*2,newseqwith(w*2,0))
    white = newseqwith(w*2,newseqwith(w*2,0))
    cumBlack = newseqwith(w*2+1,newseqwith(1+w*2,0))
    cumWhite = newseqwith(w*2+1,newseqwith(1+w*2,0))
  for i in 0..<n:
    var
      xyc = stdin.readline.split
      x = xyc[0].parseint mod w
      y = xyc[1].parseint mod w
      c = xyc[2]
    if c == "W":
      white[x][y] += 1
      white[x+w][y] += 1
      white[x+w][y+w] += 1
      white[x][y+w] += 1
    else:
      black[x][y] += 1
      black[x+w][y] += 1
      black[x+w][y+w] += 1
      black[x][y+w] += 1
  for i in 0..<2*w:
    for j in 0..<2*w:
      cumBlack[i+1][j+1] = cumBlack[i+1][j] +  black[i][j]
      cumWhite[i+1][j+1] = cumWhite[i+1][j]  + white[i][j]
  for i in 0..<2*w:
    for j in 0..<2*w:
      cumBlack[i+1][j+1] += cumBlack[i][j+1]
      cumWhite[i+1][j+1] += cumWhite[i][j+1]
  
  # 縦横2回ずつ繰り返す
  var
    wnum = 0
    bnum = 0
  for i in k+1..k+w:
    for j in k+1..k+w:
      #echo "(i, j) = (", i, ", " ,j,")"
      #echo "(i-k-1, j-k-1) = (", i-k-1, ", " ,j-k-1,")"
      wnum = cumWhite[i][j] + cumWhite[i-k][j-k] - cumWhite[i][j-k] - cumWhite[i-k][j]
      wnum += cumWhite[i+k][j+k] + cumWhite[i][j] - cumWhite[i+k][j] - cumWhite[i][j+k]
      bnum  = cumBlack[i+k][j] + cumBlack[i][j-k] - cumBlack[i+k][j-k] - cumBlack[i][j]
      bnum  += cumBlack[i][j+k] + cumBlack[i-k][j] - cumBlack[i-k][j+k] - cumBlack[i][j]
      #echo "(wnum, bnum) = (", wnum,  ", ", bnum, ")"
      result = max(result, wnum+bnum)





echo solve3()