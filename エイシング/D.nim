import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')

var
  p_p1:seq[int]
  p_m1:seq[int]
  p_p1_sum:int
  p_m1_sum:int

  memo = initTable[int,int]()


proc pcount(n,popcount:int):seq[int]=
  if popcount <= 0 or n < popcount:
    return @[]
  result = newseqwith(n+1,0)
  var m = 1
  for i in 0..n:
    result[i] = m mod popcount
    m = m mod popcount
    m *= 2

proc fRec(n:int,count:int=0):int=
  if memo.hasKey(n):
    return memo[n]+count
  if n==0:
    return count
  else:
    var pcount = n.toBin(40).count('1')
    var t = fRec(n mod pcount,count+1)
    memo[n] = t-count
    return t

proc prepare(n:int,x:string)=
  var popcount = x.count('1')
  p_p1 = pcount(n,popcount+1)
  p_p1_sum = p_p1.foldr(a+b) mod (popcount+1)
  p_m1 = pcount(n,popcount-1)
  if popcount-1 > 0:
    p_m1_sum = p_m1.foldr(a+b) mod (popcount-1)
  #echo p_p1
  #echo p_m1
  # popcount+-1の3通りが初回の割る数になる
  # 割られる数は2^(2E5)が最悪値
  # 事前に計算しておく

proc firstStep(t:string, uset:int,i:int):string=
  var pcount =t.count('1')
  var psum:int
  if uset == 1:
    psum = p_m1_sum - p_m1[i] + p_p1[i]
  else:
    psum = p_p1_sum + p_m1[i] - p_p1[i]
  while psum < 0:
    psum+=pcount
  
  var s = psum mod pcount
  return s.toBin(t.len)






proc solve()=
  var
    n = scan()
    x = read()
    #n = 2E5.int
    #x = "1".repeat(2E5.int-5) & "00000"
  prepare(n,x)
  for i in 0..<n:
    var uset = 0
    var t = x
    if t[i] == '1':
      t[i] = '0'
      uset = 1
    else:
      t[i] = '1'
      uset = 0
    if t.len>=20:
      t = firstStep(t,uset,n-i-1)
      echo fRec(fromBin[int](t),1)
    else:
      echo fRec(fromBin[int](t))


solve()

