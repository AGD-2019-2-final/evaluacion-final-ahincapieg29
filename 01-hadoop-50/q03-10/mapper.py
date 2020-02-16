import sys
if __name__ == "__main__":
	for line in sys.stdin:
		letra = ""
		num = 0
        
		line = line.strip()
		splits = line.split(",")
		letra = splits[0]
		num = splits[1]
		b = (letra + ',' + num)
		print(b)  


