def welcome():
    print("Welcome to python")

welcome()

print("*****************************")
print("**No return type without argument**")
def add():
    a=int(input("Enter the number :"))
    b=int(input("Enter the number :"))
    c=a+b
    print("Total is :",c)

add()
print("****************************")
print("**No return type with argumaent**")
def sub(a,b):
    c=a-b
    print("Difference is :",c)

sub(10,8)
print("**************************")
print("**Return type without argument**")
def mul():
    a=int(input("Enter the number :"))
    b=int(input("Enter the number :"))
    c=a*b
    return c

d=mul()
print("The multiple of two number is :",d)
print("**************************")
print("**Return type with argument**")
def div(a,b):
    d=a/b
    return d
e=div(10,2)
print("The division is :",e)
print("*****************************")
print("**Arbitray argument function (*) * is arbitray argument.that is multiple values using in arbitrary function **")
def class_10(*data):
    print(data)

    for user in data:
        print(user)
class_10("ram","mam","bom","leem")
print("******************************")
print("**Key word argument function**")
def data(name,age):
    print(name," age is ", age)
data(name="Ram",age=25)
print("**************************************")
print("**Arbitrary keyword argument function**")
def details(**datas):
    print(datas)

    for x in datas.items():
        print (x,)
details(name="selva",age=24,married="single")
print("*********************************")
print("**Default parameter function**")
def defaultpara(name,city="salem"):
    print(name,"your city is",city)

defaultpara(name="selva",city="madhurai")
defaultpara(name="selva")
print("*******************************") 
print("**Passing a list as on argument function**")
def total(marks):
    print("Total marks is :",sum(marks))

total(marks=[10,20,30,40,50])
total([10,20,30,40,50])
print("***********************") 
print("***********Recursive function**************")
def factorial(x):
    if (x==1):
        return 1
    else:
        return(x*factorial(x-1))
    
print("factorial 5 :",factorial(5))
print("**************************************)
print("**Lambda function**")
c=lambda a:a+50
print(c(5))
d=lambda a,b:a*b
print(d(10,10))




