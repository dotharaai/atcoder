import algorithm, sequtils, strutils, math,tables, queues
let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s
 
proc read:int = get().parseInt


var s:string


const modi = 1E9.int+7


const nums = @["A","2","3","4","5","6","7","8","9","10","J","Q","K"]


proc parseDeck(deck_suit:var seq[char],deck_num:var seq[int],s:string)=
  #echo s
  deck_suit.add(s[0])
  for idx, num in nums:
    if num == s[1..num.len]:
      deck_num.add(idx+1)
      parseDeck(deck_suit,deck_num,s[1+num.len..<s.len])
      break



proc echo_trash(suit:seq[char], num:seq[int], trash:seq[int])=
  if trash.len==0:
    echo 0
    return
  for idx in trash:
    stdout.write(suit[idx])
    stdout.write(nums[num[idx]-1])
  echo ""

proc solve()=
  var s = stdin.readline()
  var deck_suit = newseq[char](0)
  var deck_num = newseq[int](0)
  parseDeck(deck_suit,deck_num,s)
  #echo deck_suit
  #echo deck_num
  var
    s_hand:int
    s_trash:seq[int] = @[]
    h_hand:int
    h_trash:seq[int] = @[]
    c_hand:int
    c_trash:seq[int] = @[]
    d_hand:int
    d_trash:seq[int] = @[]
  for idx, num in deck_num:
    if num in @[10,11,12,13,1]:

      if deck_suit[idx] == 'S':
        s_hand+=1
        if s_hand == 5:
          echo_trash(deck_suit,deck_num,s_trash)
          return 
        h_trash.add(idx)
        c_trash.add(idx)
        d_trash.add(idx)

      if deck_suit[idx] == 'H':
        h_hand+=1
        if h_hand == 5:
          echo_trash(deck_suit,deck_num,h_trash)
          return
        s_trash.add(idx)
        c_trash.add(idx)
        d_trash.add(idx)
      if deck_suit[idx] == 'C':
        c_hand+=1
        if c_hand == 5:
          echo_trash(deck_suit,deck_num,c_trash)
          return 
        s_trash.add(idx)
        h_trash.add(idx)
        d_trash.add(idx)
      if deck_suit[idx] == 'D':
        d_hand+=1
        if d_hand == 5:
          echo_trash(deck_suit,deck_num,d_trash)
          return 
        s_trash.add(idx)
        c_trash.add(idx)
        h_trash.add(idx)
    else:
      s_trash.add(idx)
      h_trash.add(idx)
      c_trash.add(idx)
      d_trash.add(idx)








solve()