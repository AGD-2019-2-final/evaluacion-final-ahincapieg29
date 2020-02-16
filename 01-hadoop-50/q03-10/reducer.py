import sys
import string

if __name__ == '__main__':
    list = []
    
    for line in sys.stdin:
        line = line.strip()
        (key, val) = line.split(',')
        val = int(val)
           
        list.append((key, val))
    
    list = sorted(list, key=lambda tup:tup[1])
    
    for i in list:
        print(i[0] + ',' + str(i[1]))


