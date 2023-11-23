try:
    a=10/0

except Exception as e:
    print(e)

print("---------------------")
print("** exception else **")
try:
    a=10/20

except Exception as e:
    print(e)

else:
    print("A value is :",a)

print("--------------------------")
print("**Try except else finally**")
try:
    a=10/5

except Exception as e:
    print(e)

else:
    print("A value is :",a)

finally:
    print("Thank you")

print("-----------------")
print("**Types of exception in python**")
print(dir(locals()['__builtins__']))
print(len(dir(locals()['__builtins__'])))

print("---------------------------------")
'''print("**Name error**")
try:
    print(a)

except NameError as e:
    print("A is not difined")
    '''
print("-----------------------------")
print("**Zero division error**")
try:
    a=10/0

except ZeroDivisionError as e:
    print("denominator cannot be zero")

print("----------------------------")
print("**Value error**")
try:
    a=int("string")

except ValueError as e:
    print("Enter only number")

print("----------------------------------")
print("**Index error**")
try:
    a=[10,20,30,40,50]
    print(a[10])

except IndexError as e:
    print("Invalid index")

print("---------------------------------------")
print("**File not found error**")
try:
    f=open("test.txt")

except FileNotFoundError as e:
    print("File is not in the folder")

else:
    print(f.read())

print("----------------------------")
print("**Handling multiple exception in python**")
try:
    a=10/20
    print(a)
    b=[10,20,30,40,50]
    print(b[10])

except ZeroDivisionError :
    print("Denominator cannot be zero")

except IndexError:
    print("Invalid index")