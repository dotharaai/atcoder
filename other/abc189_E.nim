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


type matrix = ref object
  v:array[3,array[3,int]]

type vector = ref object
  v:array[3,int]


var
  type1 = matrix(v:[
  [0,1,0],
  [-1,0,0],
  [0,0,1]
  ]
    )
  type2 = matrix(v:[
  [0,-1,0],
  [1,0,0],
  [0,0,1]
  ]
    )



proc mul(x,y:matrix):matrix=
  result = matrix(v:[[0,0,0],[0,0,0],[0,0,0]])
  for i in 0..<3:
    for j in 0..<3:
      for k in 0..<3:
        result.v[i][j] += x.v[i][k]*y.v[k][j]
  return

proc mul(x:matrix,y:vector):vector=
  result = vector(v:[0,0,0])
  for i in 0..<3:
    for j in 0..<3:
      result.v[i] += x.v[i][j]*y.v[j]
  return


proc solve()=
  var
    n = scan()
    p = newseqwith(n,vector(v:[scan(),scan(),1]))
    m = scan()
    ops = newseq[matrix](m+1)
  ops[0] = matrix(v:
    [
      [1,0,0],
      [0,1,0],
      [0,0,1]
    ])
  for i in 1..m:
    var op = stdin.readLine.split()
    if op[0]=="1":
      ops[i] = mul(type1,ops[i-1])
    if op[0]=="2":
      ops[i] = mul(type2,ops[i-1])
    if op[0]=="3":
      var p = op[1].parseInt
      var o = matrix(v:[
        [-1,0,2*p],
        [0,1,0],
        [0,0,1]
      ])
      ops[i] = mul(o,ops[i-1])
    if op[0]=="4":
      var p = op[1].parseInt
      var o = matrix(v:[
        [1,0,0],
        [0,-1,2*p],
        [0,0,1]
      ])
      ops[i] = mul(o,ops[i-1])
  var q = scan()
  #echo "========"
  for i in 0..<q:
    var (a,b)=(scan(), scan()-1)
    #for l in ops[a].v:
      #echo l
    var res = mul(ops[a],p[b])
    echo res.v[0], " ", res.v[1]
  
  
      

  

  
solve()