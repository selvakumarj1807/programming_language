a=int(input("Enter the number of days :"))
if a >= 1 and a <= 5:
    print("your fine amount is",a * 0.5)
elif a > 5 and a <= 10:
    print("your fine amount is",a * 1)
elif a > 10 and a <= 30:
    print("your fine amount is",a * 5)
else:
    print("Submission cancelled")
