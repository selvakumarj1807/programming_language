user={"name":"selva","age":"23","married":"no"}
print(user)
print(type(user))
print(user["name"])
print(user.get("age"))
print(user.keys())
print(user.values())
print(user.items())
print("**************")
for x in user:
    print(x," ",user[x])
for x in user.keys():
    print(x)
for x in user.values():
    print(x)
for x in user.items():
    print(x)
print("**************")
if "age" in user:
    print("yes")
print("***********changing values***********")

user={"name":["selva"],"age":"23","married":"no"}
print(user)

user['name'].append("kumar")

print(user)



user.update({"phone":"9500912258"})
print(user)
user["age"]="25"
print(user)
user.pop("age")
print(user)
user.clear()
print(user)
print("**********************")
users={"user1":{"name":"selva","age":"24"},"user2":{"name":"kumar","age":"25"}}
print(users)


print('----------------------------------------------')

users={"user1":{"name":"selva","age":"24"},"user2":{"name":"kumar","age":"25"}}
print(users)

users = {"user1": {"name": "selva", "age": "24"}, "user2": {"name": "kumar", "age": "25"}}

# Retrieve user1's name and age
user1_name = users["user1"]["name"]
user1_age = users["user1"]["age"]

user2_name = users["user2"]["name"]
user2_age = users["user2"]["age"]

# Print the values
print("User1 Name:", user1_name)
print("User1 Age:", user1_age)

print("User2 Name:", user2_name)
print("User2 Age:", user2_age)

