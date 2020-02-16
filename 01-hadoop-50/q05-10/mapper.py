import sys
if __name__ == "__main__":
	for line in sys.stdin:
		mes = ""
		
		line = line.strip()
		splits = line.split("-")
		mes = splits[1]
		b = (mes + '\t1')
		print(b)  
