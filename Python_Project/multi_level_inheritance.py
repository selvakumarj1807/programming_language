print("** Multi leve inheritance **")

class grand_father:
    def own_house(self):
        print("Grand fathe build a house")

class father(grand_father):
    def own_bike(self):
        print("Father buy the own bike")

class son(father):
    def book(self):
        print("Son buy a book")

o = son()
o.book()
o.own_bike()
o.own_house()