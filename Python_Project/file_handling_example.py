print("** File handling **")

try:
    file = open("test.txt","r")
    print(file.read())

except FileNotFoundError:
    print("Error : the file is not in your folder")

else:
    file.close()