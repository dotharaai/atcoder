import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
template `mod=`(x,y) = x = x mod y
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc solveRec(cdx,cdy,cdr:seq[int],r:int):bool=
  echo "now: ", r
  if r==0:
    echo cdx
    echo cdy
    echo cdr
    return true
  else:
    for x in 0..1500:
      for y in 0..1500:
        block check:
          if x-r<0 or x+r>1500 or y-r<0 or y+r>1500:
            break check
          for n in 0..<cdx.len:
            #一つでも条件を満たさなかったら次の座標を試す
            if (cdx[n]-x)^2+(cdy[n]-y)^2<(cdr[n]+r)^2:
              break check
          var ans = solveRec(cdx & @[x],cdy & @[y], cdr & @[r], r-1)
          if ans:
            return true
    return false





proc solve()=
  var
    n = 100
    (w,h)=(1500,1500)
    k = newseqwith(n,0)
    x= @[100, 99, 98, 97, 96, 95, 94, 215, 256, 256, 257, 257, 258, 258, 367, 385, 399, 399, 400, 399, 399, 490, 492, 514, 524, 522, 523, 522, 596, 603, 609, 617, 626, 626, 627, 657, 686, 689, 62, 686, 698, 703, 708, 724, 735, 741, 247, 739, 745, 353, 744, 751, 769, 790, 789, 794, 799, 802, 804, 812, 502, 810, 815, 816, 815, 817, 381, 819, 820, 514, 483, 825, 214, 504, 596, 507, 24, 23, 22, 21, 20, 19, 18, 17, 121, 111, 149, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
    y= @[100, 299, 496, 691, 884, 1075, 1264, 1407, 1171, 981, 788, 595, 398, 201, 1311, 85, 298, 495, 689, 884, 1075, 1421, 1203, 183, 787, 980, 396, 591, 1312, 1102, 70, 287, 494, 685, 885, 1435, 1209, 999, 1432, 176, 388, 785, 590, 1329, 56, 279, 54, 1104, 888, 1449, 488, 688, 1450, 144, 1248, 972, 360, 810, 558, 1164, 40, 1372, 1053, 224, 439, 634, 1188, 734, 32, 291, 1311, 290, 1286, 1096, 1199, 494, 198, 395, 589, 782, 972, 1160, 1347, 17, 1484, 1372, 1170, 1192, 622, 231, 164, 359, 41, 421, 248, 54, 140, 62, 2, 5]
    r = @[100, 99, 98, 97, 96, 95, 94, 93, 92, 91, 90, 89, 88, 87, 86, 85, 84, 83, 82, 81, 80, 79, 78, 77, 76, 75, 74, 73, 72, 71, 70, 69, 68, 67, 66, 65, 64, 63, 62, 61, 60, 59, 58, 57, 56, 55, 54, 53, 52, 51, 50, 49, 48, 47, 46, 45, 44, 43, 42, 41, 40, 39, 38, 37, 36, 35, 34, 33, 32, 31, 30, 29, 28, 27, 26, 25, 24, 23, 22, 21, 20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
  #x=x.reversed()
  #y=y.reversed()
  #for i in 0..<n:
    #echo x[i]," ",y[i]
  for x in 0..<10:
    for y in 0..<10:
      echo 50+100*x, " ", 50+100*y
  #echo solveRec(@[],@[],@[],100)

  return


for i in 1..100:
  echo i, ", ", ((400-i)*(i+1)).div(2)
    

    
  
solve()