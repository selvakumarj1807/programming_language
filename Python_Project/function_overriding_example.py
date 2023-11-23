print("** Function overrriding **")

class employee:
    def working_hrs(self):
        self.hours=50

    def print_hrs(self):
        print("The employee working hours is :",self.hours)

class trainee(employee):
    def working_hrs(self):
        self.hours=60

    def reset_hrs(self):
        super().working_hrs()

    
emplo = employee()
emplo.working_hrs()
emplo.print_hrs()

trainer = trainee()
trainer.working_hrs()
trainer.print_hrs()
trainer.reset_hrs()
trainer.print_hrs()
        