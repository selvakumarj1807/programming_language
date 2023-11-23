print(" ** File line print looping in python ** ")

try:
    file = open("test.txt","r")

    for line in file:
        print(line)
   

except FileNotFoundError:
    print("Error : the file is not in your folder")

else:
    file.close()