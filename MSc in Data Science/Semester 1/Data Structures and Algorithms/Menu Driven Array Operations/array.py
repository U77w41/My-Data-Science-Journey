# Array
# Menu Driven Function

#insert function
def insert():
    global x
    global a
    x = int(input("Enter the number of elements you wish to insert: "))
    i = a
    if (x+a) > n :
        print("Not Possible.")
    else:
        while i < (a+x) :
            y = int(input("Enter the element one by one: "))
            global MENU
            MENU[i] = y
            i += 1
        b = x+a
        a = b

#search function
def search():
    y = int(input("What do you wish to search for?  "))
    found = False
    i = 0
    while i < a:
        if MENU[i] == y:
            found = True
            print(f"{y} has been found at {i + 1}th position")
        i += 1
    if not found :
        print("Not Found.... \n")

#delete function
def deletion():
    global MENU
    global a
    y = int(input("Which element do you wish to delete?  "))
    i = 0
    while i < a:
        if MENU[i] == y:
            j = i
            while j < a-1:
                MENU[j] = MENU[j+1]
                j += 1
            MENU[j] = 0
            a = j
        i += 1

#sorting function (ascending)
def sort():
    global MENU
    for i in range(1,a):
        temp = MENU[i]
        j = i - 1
        while j >= 0 and temp < MENU[j] :
            MENU[j+1] = MENU[j]
            j -= 1
        MENU[j+1] = temp


print("MENU Driven Program")
n = int(input("Enter the number of spaces to be declared:  "))
MENU = [0]*n
a = 0
should_continue = True
while should_continue:
    order = int(input("Type 1 for Insertion\n2 for Deletion\n3 for Search\n4 for Sorting\n5 for Traversing\n0 to Exit\n"))
    if order == 1:
        insert()
    elif order == 2:
        deletion()
    elif order == 3:
        search()
    elif order == 4:
        sort()
    elif order == 5:
        print(MENU)
    elif order == 0:
        should_continue = False
    else:
        print("Wrong choice! Please Try Again.")


