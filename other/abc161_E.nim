import sequtils, algorithm,strutils,sets


const debug=true


proc solve(n,k,c:int,s:string):seq[int]=
  #echo s
  # date[workday-1] : workday日目の勤務を行うことができるもっとも若い日付
  var shiftTableForward = newseqwith(k,0)
  var calender = 0
  for day, isWorkable in s:
    if isWorkable == 'o':
      if calender == 0:
        shiftTableForward[calender] = day
        calender+=1
      else:
        if shiftTableForward[calender-1]+c < day:
          shiftTableForward[calender] = day
          calender+=1
    if calender==k:
      break
  
  #echo shiftTableForward

  var shiftTableBackward = newseqwith(k,0)
  calender = k-1
  for day in countdown(n-1,0):
    var isWorkable = s[day]
    #echo $day & ", " & $isWorkable
    if isWorkable == 'o':
      if calender == k-1:
        shiftTableBackward[calender]=day
        calender-=1
      else:
        if shiftTableBackward[calender+1] - c > day:
          shiftTableBackward[calender] = day
          calender-=1
    if calender == -1:
      break
  #echo shiftTableBackward

  var ft = shiftTableForward.mapIt(it + 1)
  var bt = shiftTableBackward.mapIt(it + 1)
  result = @[]
  for i in 0..<ft.len:
    if ft[i] == bt[i]:
      echo ft[i]
      result.safeadd(ft[i])
  

  return result


assert(solve(11,3,2,"ooxxxoxxxoo") == @[6], "sample1 failed")
assert(solve(5,2,3,"ooxoo") == @[1,5], "sample2 failed")
assert(solve(5,1,0,"ooooo") == @[], "sample3 failed")
assert(solve(16,4,3,"ooxxoxoxxxoxoxxo") == @[11,16], "sample4 failed")


var t = stdin.readLine.split(" ").mapIt(it.parseInt)
var s = stdin.readLine
discard solve(t[0],t[1],t[2],s)