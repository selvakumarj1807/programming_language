print("**Date time package in python**")
import datetime as dt
current_date=dt.date.today()
print("Current date is :",current_date)
print("*******************************")
new=dt.date(2023,10,10)
print(new)
print(new.day)
print(new.month)
print(new.year)
print("***************************")
time=dt.time(10,45,5,55)
print(time)
print(time.hour)
print(time.minute)
print(time.second)
print(time.microsecond)
print("********************************************")
current_time=dt.datetime.now()
print(current_time)
print("************************")
new_datetime=dt.datetime(2023,5,11,8,25,8,38)
print(new_datetime)
print(new_datetime.date())
print(new_datetime.time())
print("******************************")
print("**Difference between two year**")
current_date=dt.datetime.now()
new_date=dt.datetime(2023,10,18)
difference=new_date-current_date
print(difference)
print("---------------------------------------")
print("**date format**")
current_date=dt.datetime.now()
print(current_date)
format_date=current_date.strftime("%A %B %d %Y")
formatted_date=current_date.strftime("%d %B %Y")
print(format_date)
print(formatted_date)