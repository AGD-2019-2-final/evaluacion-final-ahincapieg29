import sys
if __name__ == "__main__":
    for line in sys.stdin:
        a = ""
        line = line.strip()
        splits = line.split("   ")
        a = splits[0]
        print(a + '\t1')
