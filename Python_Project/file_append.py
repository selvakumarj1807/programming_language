print("** File append or add in python **")

try:
    file = open("test.txt","a")
    file.write(" Hi this is append or add file concept in python")
    file.close()
    file = open("test.txt","r")
    print(file.read())
    

except FileNotFoundError:
    print("Error : the file is not in your folder")

else:
    file.close()