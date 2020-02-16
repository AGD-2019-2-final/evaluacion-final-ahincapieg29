import sys

for line in sys.stdin:
    a = ""
    b = ""
    line = line.strip()
    splits = line.split("\t")
    a = splits[0]
    b = splits[1]
    for i in b.split(","):
        print(i + "\t" + a)




