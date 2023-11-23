"""

a=10
b=20
print(a+b)
print(a,b)

c='selva'
d='kumar'
print(c+d)
print(c,d)


"""



print("** Operator overloading using polymorphism **")

class addition:
    def __init__(self,a):
        self.a=a

    def __add__(o1,o2):
        return o1.a+o2.a
    
    def __sub__(o1,o2):
        return o1.a-o2.a
    
o1=addition(10)
o2=addition(20)
print("Total is :",(o1+o2))
print("Differnce is :",(o2-o1))       



