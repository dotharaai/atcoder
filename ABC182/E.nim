import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc solveworst():int=
  var 
    (h,w,n,m)=(100,100,100*100,0)
    board = @["#".repeat(w+2)] & newseqwith(h,"#"&".".repeat(w) & "#") & @["#".repeat(w+2)]
    light_h = newseqwith(h+2,newseqwith(w+2,false))
    light_v = newseqwith(h+2,newseqwith(w+2,false))
    a = newseqwith(n,0)
    b = newseqwith(n,0)

    c = newseqwith(m,0)
    d = newseqwith(m,0)
  for i in 0..<n:
    (a[i],b[i])=(i.div(w)+1,i.mod(w)+1)
  for i in 0..<m:
    (c[i],d[i])=(i+1,i+2)
    board[c[i]][d[i]] = '#'
  for i in 0..<n:
    var
      left=0
      right=0
      up=0
      down=0
    while board[a[i]][b[i]-left]!='#' and light_h[a[i]][b[i]-left] == false:
      light_h[a[i]][b[i]-left]=true
      left+=1
    while board[a[i]][b[i]+right]!='#' and light_h[a[i]][b[i]+right] == false:
      light_h[a[i]][b[i]+right]=true
      right+=1
    while board[a[i]-up][b[i]]!='#'  and light_v[a[i]-up][b[i]] == false:
      light_v[a[i]-up][b[i]]=true
      up+=1
    while board[a[i]+down][b[i]]!='#'  and light_h[a[i]+down][b[i]] == false:
      light_v[a[i]+down][b[i]]=true
      down+=1
  for y in 1..h:
    for x in 1..w:
      if light_h[y][x] or light_v[y][x]:
        result+=1


proc solve():int=
  var 
    (h,w,n,m)=(scan(),scan(),scan(),scan())
    board = @["#".repeat(w+2)] & newseqwith(h,"#"&".".repeat(w) & "#") & @["#".repeat(w+2)]
    
    light_h = newseqwith(h+2,newseqwith(w+2,false))
    light_v = newseqwith(h+2,newseqwith(w+2,false))
    a = newseqwith(n,0)
    b = newseqwith(n,0)

    c = newseqwith(m,0)
    d = newseqwith(m,0)
  for i in 0..<n:
    (a[i],b[i])=(scan(),scan())
  for i in 0..<m:
    (c[i],d[i])=(scan(),scan())
    board[c[i]][d[i]] = '#'
  for i in 0..<n:
    var
      left=0
      right=1
      up=0
      down=1
    while board[a[i]][b[i]-left]!='#' and light_h[a[i]][b[i]-left] == false:
      light_h[a[i]][b[i]-left]=true
      left+=1
    while board[a[i]][b[i]+right]!='#' and light_h[a[i]][b[i]+right] == false:
      light_h[a[i]][b[i]+right]=true
      right+=1
    while board[a[i]-up][b[i]]!='#'  and light_v[a[i]-up][b[i]] == false:
      light_v[a[i]-up][b[i]]=true
      up+=1
    while board[a[i]+down][b[i]]!='#'  and light_v[a[i]+down][b[i]] == false:
      light_v[a[i]+down][b[i]]=true
      down+=1
  for y in 1..h:
    for x in 1..w:
      if light_h[y][x] or light_v[y][x]:
        result+=1




  
    




  
    
  

echo solve()
#echo solveworst()