m1=int(input("Enter m1 :"))
m2=int(input("Enter m2 :"))
m3=int(input("Enter m3 :"))
total=m1+m2+m3
average=total/3.0
if m1 >= 35 and m2 >= 35 and m3 >= 35:
    print("Pass")
    if average>=90 and average<=100:
        print("A grade")
    elif average>=80 and average<=90:
        print("B grade")
    else:
        print("D grade")
else:
    print("Fail")
