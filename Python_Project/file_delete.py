print("** File Delte in python **")

import os

if os.path.exists("file_del.txt"):
    os.remove("file_del.txt")
    # os.rmdir("folder name") if want to delete a folder

else:
    print("File is not found")