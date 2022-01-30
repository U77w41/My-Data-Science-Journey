#Stack

lst=[]

l=int(input("What is the length of your Stack:  \n"))

for n in range(l):
    x=int(input("Type elements value (in integer) and Press Enter \n"))
    lst.append(x)
print("The Stack you have created is:  " , lst)

def menu():
    print("\n \n What Stack Operation do you want to perform : \n")
    print("(1) Push Operation \n")
    print("(2) Pop Operation \n")
    print("(0) Exit \n")
menu()
option=int(input("Enter your choice: \n"))  

if option==1:
    new=int(input("Plase Enter the element you want to be pushed: \n"))
    lst.append(new)
    print("Your New Stack is : \n ", lst)
elif option==2:
    lst.remove(lst[l-1])
    print("The last element has been poped: \n Your new stack is" , lst)
elif option==0:
    print("Thank You")
else:
    print("\n \n \n \n Please again run the code and enter the correct choice !")
