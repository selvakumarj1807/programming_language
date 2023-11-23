print("** Handling Diomand problem in python **")

class A:
    def display(self):
        print("I am a class of A")

class B(A):
    def display(self):
        print("I am a class of B")

class C(A):
    def display(self):
        print("I am a class of C")

class D(B,C):
    def display(self):
        print("I am a class of D")

o = D()
o.display()