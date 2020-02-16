import sys

currentkey = None
nums = []

for line in sys.stdin:
    key, value = line.split("\t")
    value = int(value)
    if key == currentkey:
        nums.append(value)
    else:
        if currentkey is not None:
            nums.sort()
            print(currentkey + "\t" + str(nums).replace("[", "").replace("]", "").replace(" ", ""))
        currentkey = key
        nums = [value]
nums.sort()
print(currentkey + "\t" + str(nums).replace("[", "").replace("]", "").replace(" ", ""))


