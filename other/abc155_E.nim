import  strutils, sequtils

#var N = stdin.readline

proc solve(N:string):int=
  var table = newseq[int](N.len+1)
  var ll = newseq[int](N.len+1)
  var flag = false
  for i in countdown(N.len-1,0):
    table[N.len-i-1] = ($N[i]).parseInt
    ll[N.len-i-1] = ($N[i]).parseInt
  #echo table
  
  for idx, value in table:
    if value == 10:
      table[idx+1] += 1
      continue
    if value<=4:
      result += value
      #echo ll[idx],", " ,value , ", ", value, ", ", result
    elif value == 5:
      if table[idx+1] >= 5:
        result += 5
        #echo ll[idx],", " ,value , ", ", value, ", ",result
        table[idx+1] += 1
      else:
        result+=5
    else:# 6~9
      result += 10-value
      #echo ll[idx],", " ,value , ", ", 10-value, ", ",result
      table[idx+1] += 1
      

      
  return result

echo solve(stdin.readline)
#echo solve("36"), " == 8"
#echo solve("91") , " ==  3"
#echo solve("314159265358979323846264338327950288419716939937551058209749445923078164062862089986280348253421170") , " == 243"
#echo solve("170"), " == 5"
#echo solve("421170"), " == 12"
#echo solve("99"), " == 2"
#echo solve("999"), " == 2"
#echo solve("9"), " == 2"
#echo solve("89"), " == 3"
#echo solve("199"), " == 3"
#echo solve("1990"), " == 3"
#echo solve("1111111"), " == 7"
#echo solve("555"), " == 14"
#echo solve("65"), " == 9"
#echo solve("545"), " == 14"