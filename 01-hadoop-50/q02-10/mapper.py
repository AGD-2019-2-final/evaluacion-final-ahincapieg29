import sys
if __name__ == "__main__":
	for line in sys.stdin:
		purpose = ""
		amount = ""
        
		line = line.strip()
		splits = line.split(",")
		purpose = splits[3]
		amount = splits[4]
		b = (purpose + '\t' + amount)
		print(b)   


