

class car():
    pass

a=10
print(type(a))
print(type(car))

swift=car()

print(isinstance(swift,car))
print(isinstance(a,int)) # a is integer class object or not
print(type(swift)) # "__main__" is a speciel variable

print("----------------------------")

class student():
    name="selva"
    age=14
    gender=""
    city=""

print("**Get attribute method**")

print(getattr(student,'name'))
print(getattr(student,'age'))
print(getattr(student,'gender','No such attribute found'))


print("--------------------------")
print("**Dot notation**")

print(student.name)
print(student.age)

print("----------------------------------")
print("**Set attribute**")
setattr(student,'name','kumar')
print(student.name)
setattr(student,'gender','male')
print(student.gender)
student.city="salem"
print(student.city)

print("----------------------------------")

print(student.__dict__)

print("----------------------------")
print("**Delete attribute**")
delattr(student,'age')
print(student.__dict__)
del student.city
print(student.__dict__)

print("--------------------------------")

print("**Instanse attribute**")

class user():
    course="java"

print(user.course)
print(user.__dict__)

o=user()
print(o.__dict__)
print(o.course)
o.course="Python"
print(o.__dict__)
print(o.course)
o2=user()
print(o2.course)

print("-----------------------------------------")
print("**class method in python**")

class student1():
    name="selva"
    age=25

    def printall():
        print("Name is :",student1.name)
        print("Age is :",student1.age)

student1.printall() 
print(student1.__dict__)
print("-----------------------------------------")

print(getattr(student1,'printall'))
getattr(student1,'printall')()
print(student1.__dict__['printall'])
student1.__dict__['printall']()
print("--------------------------------")

print("**Instanse method**")

class student2():
    name="kumar"
    age=23

    def printall(self,gender):
        print("Neme is :",student2.name)
        print("Age is :",student2.age)
        print("Gender is :",gender)

o=student2()
'''
o.printall()
student2.printall(o)
'''
o.printall('male')
student2.printall(o,'male')

print("-------------------------------")
print("** __init__ method - constructor method for value intialization**")

class user1:
    def __init__(self,name):
        print("new object(attribute)are created")
        self.name=name

    def printall(self):
        print("Name is :",self.name)
        
'''
o=user1()
o1=user1()

'''
print(user1.__dict__)
print("--------------------------")
o=user1('selva')
o.printall()
print(o.__dict__)
print("-------------------------")
o1=user1('kumar')
o1.printall()
print(o1.__dict__)
print("-------------------------")

print("**Property decretor**")

'''
class user2:
    def __init__(self,name,age):
        self.name=name
        self.age=age
        self.msg="Name is :"+self.name+"  Age is :"+ str(self.age)
'''
    #def msg(self):
        #return "Name is :"+self.name+"  Age is :"+ str(self.age)
'''
    

a=user2('selva',25)
print(a.name)
print(a.age)
print(a.msg)
a.age = 39
print(a.msg)
'''
print('----------------------------------------------')
'''
class user2:
    def __init__(self,name,age):
        self.name=name
        self.age=age
        #self.msg="Name is :"+self.name+"  Age is :"+ str(self.age)

    def msg(self):
        return "Name is :"+self.name+"  Age is :"+ str(self.age)

    

a=user2('selva',25)
print(a.name)
print(a.age)
print(a.msg())
a.age = 39
print(a.msg())
a.age = 40
print(a.msg())
'''
print('---------------------------------------------------')

class user2:
    def __init__(self,name,age):
        self.name=name
        self.age=age
        #self.msg="Name is :"+self.name+"  Age is :"+ str(self.age)
    @property
    def msg(self):
        return "Name is :"+self.name+"  Age is :"+ str(self.age)

    

a=user2('selva',25)
print(a.name)
print(a.age)
print(a.msg)
a.age = 39
print(a.msg)
a.age = 40
print(a.msg)


print("----------------------------------")
print("**Property decorator getter and setter**")
class stud:
    def __init__(self,total):
        self._total=total   #_total is private variable

    def average(self):
        return self._total/5.00
    
    @property
    def total(self):
        return self._total
    
    @total.setter
    def total(self,t):
        if t<0 or t>500:
            print("Invalid total is above 500")

        else:
            self._total=t

    
b=stud(450)
print("Total is :",b.total)
print("Average is :",b.average())
b.total=550
print("Total is :",b.total)
print("Average is :",b.average())
b.total=250
print("Total is :",b.total)
print("Average is :",b.average())

print("--------------------------------------------")
print("**Property method (Function)**")

class stud1:
    def __init__(self,total):
        self._total=total   #_total is private variable

    def average(self):
        return self._total/5.00
    
    def getter(self):
        return self._total
    
    def setter(self,t):
        if t<0 or t>500:
            print("Invalid total is above 500")

        else:
            self._total=t

    total=property(getter,setter)


b=stud1(450)
print("Total is :",b.total)
print("Average is :",b.average())
b.total=550
print("Total is :",b.total)
print("Average is :",b.average())
b.total=250
print("Total is :",b.total)
print("Average is :",b.average())

print("---------------------------------")

print("**Class method decoretor in python**")
class students:
    count=0

    def __init__(self,name,age) :
        self.name=name
        self.age=age
        students.count+=1

    def printDetails(self):
        return print("Name is :",self.name,"Age is :",self.age)
    
    @classmethod
    def total(cls):
        return cls.count
    
ab=students("selva",25)
ab.printDetails()
print("Total admission :",ab.total())
ba=students("kumar",27)
ba.printDetails()
print("Total admission :",ba.total())
print("Total admission :",students.total())

print("----------------------------------------")
print("**Static method in python - common for all**")
class empl:

    def __init__(self,name,age):
        self.name=name
        self.age=age

    def printempl(self):
        return print("Employee name is :",self.name,"Employee age is :",self.age)
    @staticmethod
    def welcome():
        print("welcom to our company")

sa=empl("selva",25)
sa.printempl()
empl.welcome()
sb=empl("kumar",23)
sb.printempl()
empl.welcome()

print("----------------------------------")


        
    





        


        
        