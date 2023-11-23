print("** Abstraction and Encapsulation **")

class library:

    def __init__(self,books):
        self.books=books

    def list_books(self):
        print("Available Books :")
        for book in self.books:
            print(book)

    def borrow_book(self,borrow_book):
        if borrow_book in self.books:
            print("Get your book now")
            self.books.remove(borrow_book)

        else:
            print("Book not Available")

    def receive_book(self,receive_book):
        print("You have return the book")
        self.books.append(receive_book)


books = ["c","c++","java"]
o = library(books)

msg="""
    1.Display book
    2.Borrow book
    3.Receive book
"""
while True:
    print(msg)
    ch = int(input("Enter your choise :"))
    
    if ch == 1:
        o.list_books()

    elif ch == 2:
        book=input("Enter your book name :")
        o.borrow_book(book)

    elif ch == 3:
        book=input("Enter your book name :")
        o.receive_book(book)

    else:
        print("Thank you come again")
        quit()


       