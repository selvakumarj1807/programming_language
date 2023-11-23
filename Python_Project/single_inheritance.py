print("** Single inheritance **")

class nokia:
    comany_name="Nokia"
    website="www.nokia.com"
   

    def contact_details(self):
        print("New yark")

class nokia1100(nokia):
    model_name="Nokia_1100"
    year=1978

    def model_detals(self):
        print("Product name :",self.model_name)
        print("Manufacture date :",self.year)
        print("Compny name :",self.comany_name)
        print("Website :",self.website)

mobile=nokia1100()
mobile.model_detals()
mobile.contact_details()
