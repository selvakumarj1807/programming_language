print("** Abstract Bass Class in python **")

from abc import ABC,abstractmethod

class bank(ABC):
    @abstractmethod
    def loan(self):
        pass

    @abstractmethod
    def credit(self):
        pass

    @abstractmethod
    def debit(self):
        pass

class hdfc(bank):
    def loan(self):
        print("We provide 7.5 intrest loan")

    def credit(self):
        print("We proive credit")

    def debit(self):
        print("We provide debit")

    def card(self):
        print("We provide debit & credit card")

o=hdfc()
o.loan()
o.credit()
o.debit()
o.card()
