import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
template `mod=`(x,y) = x = x mod y
template scan2 = (scan(), scan())
template scan3 = (scan(), scan())
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc scanf(): float = read().parseFloat
proc toInt(c:char): int =
    return int(c) - int('0')

proc solve2():int=
  var
    inf = int.high.div(4)
    (h,w) = (scan(),scan())
    (sh,sw)=(scan()-1,scan()-1)
    (gh,gw)=(scan()-1,scan()-1)
    stage = newseqwith(h,read())
    costs = newseqwith(h,newseqwith(w,inf))
  
  costs[sh][sw]=0

  proc solveIn(c:int):bool=
    var q = initDeque[(int,int)]()
    for nh in 0..<h:
      for nw in 0..<w:
        if costs[nh][nw]==c:
          q.addLast((nh,nw))
    result = false
    if q.len>0:
      result=true
    while q.len>0:
      var
        (nh,nw)=q.popFirst()
      # 一歩移動
      if nh-1>=0 and stage[nh-1][nw]=='.' and costs[nh-1][nw]>costs[nh][nw]:
        costs[nh-1][nw]=costs[nh][nw]
        q.addLast((nh-1,nw))

      if nh+1<h and stage[nh+1][nw]=='.' and costs[nh+1][nw]>costs[nh][nw]:
        costs[nh+1][nw]=costs[nh][nw]
        q.addLast((nh+1,nw))

      if nw-1>=0 and stage[nh][nw-1]=='.' and costs[nh][nw-1]>costs[nh][nw]:
        costs[nh][nw-1]=costs[nh][nw]
        q.addLast((nh,nw-1))

      if nw+1<w and stage[nh][nw+1]=='.' and costs[nh][nw+1]>costs[nh][nw]:
        costs[nh][nw+1]=costs[nh][nw]
        q.addLast((nh,nw+1))
  proc solveWorp(c:int):bool=
    result=false

    for nh in 0..<h:
      for nw in 0..<w:
        if costs[nh][nw]==c:
          for dh in -2..2:
            for dw in -2..2:
              if nh+dh >= 0 and nh+dh < h and nw+dw>=0 and nw+dw<w and stage[nh+dh][nw+dw]=='.' and costs[nh+dh][nw+dw]>costs[nh][nw]+1:
                result=true
                costs[nh+dh][nw+dw] = costs[nh][nw]+1
  var cost = 0
  while solveIn(cost) and solveWorp(cost):
    cost+=1
  if costs[gh][gw]==inf:
    return -1
  return costs[gh][gw]

  

proc solve():int=
  var
    inf = int.high.div(4)
    (h,w) = (scan(),scan())
    (sh,sw)=(scan()-1,scan()-1)
    (gh,gw)=(scan()-1,scan()-1)
    stage = newseqwith(h,read())
    costs = newseqwith(h,newseqwith(w,inf))
    q = initDeque[(int,int)]()
  q.addLast((sh,sw))
  costs[sh][sw]=0
  while q.len>0:
    var
      (nh,nw)=q.popLast()
    # 元の
    # 一歩移動
    if nh-1>=0 and stage[nh-1][nw]=='.' and costs[nh-1][nw]>costs[nh][nw]:
      costs[nh-1][nw]=costs[nh][nw]
      q.addLast((nh-1,nw))

    if nh+1<h and stage[nh+1][nw]=='.' and costs[nh+1][nw]>costs[nh][nw]:
      costs[nh+1][nw]=costs[nh][nw]
      q.addLast((nh+1,nw))

    if nw-1>=0 and stage[nh][nw-1]=='.' and costs[nh][nw-1]>costs[nh][nw]:
      costs[nh][nw-1]=costs[nh][nw]
      q.addLast((nh,nw-1))

    if nw+1<w and stage[nh][nw+1]=='.' and costs[nh][nw+1]>costs[nh][nw]:
      costs[nh][nw+1]=costs[nh][nw]
      q.addLast((nh,nw+1))

    for dh in -2..2:
      for dw in -2..2:
        if nh+dh >= 0 and nh+dh < h and nw+dw>=0 and nw+dw<w and stage[nh+dh][nw+dw]=='.' and costs[nh+dh][nw+dw]>costs[nh][nw]+1:
          costs[nh+dh][nw+dw] = costs[nh][nw]+1
          q.addFirst((nh+dh,nw+dw))
  if costs[gh][gw]==inf:
    return -1
  return costs[gh][gw]

  

  
  
echo solve()