import strutils, sequtils, algorithm,tables



proc solve()=
  var
    n = stdin.readLine.parseInt#.split.map(parseInt)  
    t = @[0,0,0,0]
  for i in 0..<n:
    var s = stdin.readLine
    if s == "AC":
      t[0]+=1
    elif s == "WA":
      t[1]+=1
    elif s == "TLE":
      t[2]+=1
    else:
      t[3]+=1
  echo "AC x ",t[0]
  echo "WA x ",t[1]
  echo "TLE x ",t[2]
  echo "RE x ",t[3]
  
    


  
  




solve()