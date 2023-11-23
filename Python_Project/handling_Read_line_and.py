print("** File handling Read line and Read lines **")

try:
    file = open("test.txt","r")
   # print(file.read())
   # print(file.readline())
   # print(file.readline(5))
    print(file.readlines())

except FileNotFoundError:
    print("Error : the file is not in your folder")

else:
    file.close()
