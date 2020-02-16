import sys
if __name__ == "__main__":
	for line in sys.stdin:
		credit = ""		
		line = line.strip()
		splits = line.split(",")
		credit = splits[2]
		b = (credit + '\t1')
		print(b)        


