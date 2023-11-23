print("** Multiple inheritance **")

class father:
    def fishing(self):
        print("Fishing from fother")

    def chess(self):
        print("Chess playing from fother")

class mother:
    def cooking(self):
        print("Cooking from mother")

    def chess(self):
        print("Chess playing from mother")

class son(father,mother):
    def riding(self):
        print("Riding from son")

o = son()
o.riding()
o.cooking()
o.fishing()
o.chess()