
D = int(1E9)+7
def solve():
    #(h,w) = map(int,input().split())
    #s = [input()+"#" for i in range(h)]+["#"*(w+1)]
    (h,w)=(2000,2000)
    s = ["."*2000+"#" for i in range(h)]+["#"*(w+1)]
    p = [[[0,0] for i in range(w)] for j in range(h)]
    k = sum(map(lambda x:x.count("."),s))
    for y in range(h):
        for x in range(w):
            if s[y][x]==".":
                if (x>0 and s[y][x-1]=="."):
                    p[y][x][0]=p[y][x-1][0]
                else:
                    leng = 0
                    while s[y][x+leng]==".":
                        leng+=1
                    p[y][x][0]=leng
                if (y>0 and s[y-1][x]=="."):
                    p[y][x][1]=p[y-1][x][1]
                else:
                    leng = 0
                    while s[y+1][x]==".":
                        leng+=1
                    p[y][x][1]=leng
    result=0
    for y in range(h):
        for x in range(w):
            if s[y][x] == ".":
                tp = p[y][x].sum()-1
                result += (pow(2,k-tp,D)*(pow(2,tp,D)-1))%D
                result = result%D
    return print()

print(solve())

