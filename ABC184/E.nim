import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
template `mod=`(x,y) = x = x.mod(y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')

proc nsolve():int=
  var 
    (h,w)=(2000,1000)
    inf = int.high.div(4)
    stage = "#".repeat(w+2) & newseqwith(h,"#" & "a".repeat(w) & "#") & "#".repeat(w+2)
    costs = newseqwith(h+2,newseqwith(w+2,inf))
    queP = initDeque[(int,int)]()
    s : (int,int)
    g : (int,int)
    telep = newseqwith(26,newseq[(int,int)]())
  stage[1][1]='S'
  stage[1][3]='a'
  stage[2000][999]='a'
  stage[1][2]='z'
  stage[1999][1000]='z'
  stage[2000][1000]='G'
  for y  in 0..<h+2:
    for x in 0..<w+2:
      if stage[y][x] == 'S':
        s = (x,y)
      elif stage[y][x] == 'G':
        g = (x,y)
      elif stage[y][x].isLowerAscii and stage[y][x].isAlphaAscii:
        telep[stage[y][x].ord-'a'.ord].add((x,y))
  costs[s[1]][s[0]]=0
  queP.addLast(s)
  # 各アルファベットについてテレポートは高々一回しか使わない……はず！
  while queP.len>0:
    var
      (nx,ny) = queP.popFirst()
    #echo "position:",nx,",",ny, ":", stage[ny][nx]
    if stage[ny-1][nx]!='#' and costs[ny-1][nx]>costs[ny][nx]+1:
      costs[ny-1][nx]=costs[ny][nx]+1
      queP.addLast((nx,ny-1))

    if stage[ny+1][nx]!='#' and costs[ny+1][nx]>costs[ny][nx]+1:
      costs[ny+1][nx]=costs[ny][nx]+1
      queP.addLast((nx,ny+1))

    if stage[ny][nx-1]!='#' and costs[ny][nx-1]>costs[ny][nx]+1:
      costs[ny][nx-1]=costs[ny][nx]+1
      queP.addLast((nx-1,ny))

    if stage[ny][nx+1]!='#' and costs[ny][nx+1]>costs[ny][nx]+1:
      costs[ny][nx+1]=costs[ny][nx]+1
      queP.addLast((nx+1,ny))
    
    # テレポータ―のとき
    if stage[ny][nx].isLowerAscii and stage[ny][nx].isAlphaAscii:
      var nextPs = telep[stage[ny][nx].ord - 'a'.ord]
      #echo "teleport:",nextPs
      for (tx,ty) in nextPs:
        if nx != tx or ny != ty:
          if costs[ty][tx] > costs[ny][nx]+1:
            costs[ty][tx] = costs[ny][nx]+1
            queP.addLast((tx,ty))
      telep[stage[ny][nx].ord-'a'.ord] = @[]
  
  if costs[g[1]][g[0]]==inf:
    return -1
  else:
    return costs[g[1]][g[0]]

    

  

proc solve():int=
  var 
    (h,w)=(scan(),scan())
    inf = int.high.div(4)
    stage = "#".repeat(w+2) & newseqwith(h,"#" & read() & "#") & "#".repeat(w+2)
    costs = newseqwith(h+2,newseqwith(w+2,inf))
    queP = initDeque[(int,int)]()
    s : (int,int)
    g : (int,int)
    telep = newseqwith(26,newseq[(int,int)]())
  for y  in 0..<h+2:
    for x in 0..<w+2:
      if stage[y][x] == 'S':
        s = (x,y)
      elif stage[y][x] == 'G':
        g = (x,y)
      elif stage[y][x].isLowerAscii and stage[y][x].isAlphaAscii:
        telep[stage[y][x].ord-'a'.ord].add((x,y))
  costs[s[1]][s[0]]=0
  queP.addLast(s)
  # 各アルファベットについてテレポートは高々一回しか使わない……はず！
  while queP.len>0:
    var
      (nx,ny) = queP.popFirst()
    #echo "position:",nx,",",ny, ":", stage[ny][nx]
    if stage[ny-1][nx]!='#' and costs[ny-1][nx]>costs[ny][nx]+1:
      costs[ny-1][nx]=costs[ny][nx]+1
      queP.addLast((nx,ny-1))

    if stage[ny+1][nx]!='#' and costs[ny+1][nx]>costs[ny][nx]+1:
      costs[ny+1][nx]=costs[ny][nx]+1
      queP.addLast((nx,ny+1))

    if stage[ny][nx-1]!='#' and costs[ny][nx-1]>costs[ny][nx]+1:
      costs[ny][nx-1]=costs[ny][nx]+1
      queP.addLast((nx-1,ny))

    if stage[ny][nx+1]!='#' and costs[ny][nx+1]>costs[ny][nx]+1:
      costs[ny][nx+1]=costs[ny][nx]+1
      queP.addLast((nx+1,ny))
    
    # テレポータ―のとき
    if stage[ny][nx].isLowerAscii and stage[ny][nx].isAlphaAscii:
      var nextPs = telep[stage[ny][nx].ord - 'a'.ord]
      #echo "teleport:",nextPs
      for (tx,ty) in nextPs:
        if nx != tx or ny != ty:
          if costs[ty][tx] > costs[ny][nx]+1:
            costs[ty][tx] = costs[ny][nx]+1
            queP.addLast((tx,ty))
      telep[stage[ny][nx].ord-'a'.ord] = @[]
  
  if costs[g[1]][g[0]]==inf:
    return -1
  else:
    return costs[g[1]][g[0]]

    

  
  






  
    




  
    
  

echo solve()
#echo solveworst()