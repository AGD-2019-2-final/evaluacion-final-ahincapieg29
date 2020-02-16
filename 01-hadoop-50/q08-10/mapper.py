import sys
if __name__ == "__main__":
	for line in sys.stdin:
		letra = ""
		valor = 0
        
		line = line.strip()
		splits = line.split("   ")

		letra = splits[0]
		valor = splits[2]
                
		b = (letra + '\t' + valor)
		print(b)   
