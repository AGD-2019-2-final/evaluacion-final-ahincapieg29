import sys
if __name__ == "__main__":
	for line in sys.stdin:
		letra = ""
		fecha = ""
		num = 0        
        
		line = line.strip()
		splits = line.split("   ")
		letra = splits[0]
		fecha = splits[1]
		num = splits[2]                
		b = (letra + '\t' + fecha + '\t' + num)
		print(b)  
