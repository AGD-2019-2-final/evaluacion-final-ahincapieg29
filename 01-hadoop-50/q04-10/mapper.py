import sys
if __name__ == "__main__":
    for line in sys.stdin:
        b = ""
        line = line.strip()
        splits = line.split("   ")
        b = splits[0]
        print(b + '\t1')
