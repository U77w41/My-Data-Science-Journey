#Queue

lst=[]

l=int(input("What is the length of your Queue:  \n"))

for n in range(l):
    x=int(input("Type element value (in integer) and Press Enter \n"))
    lst.append(x)
print("The Queue you have created is:  " , lst)

def menu():
    print("\n \n What Queue Operation do you want to perform : \n")
    print("(1) Enqueue Operation \n")
    print("(2) Dequeue Operation \n")
    print("(0) Exit \n")
menu()
option=int(input("Enter your choice: \n"))  

if option==1:
    new=int(input("Plase Enter the element you want to be enqueued: \n"))
    lst.append(new)
    print("Your new Queue is : \n ", lst)
elif option==2:
    lst.remove(lst[0])
    print("The first element has been dequeued: \n Your new stack is" , lst)
elif option==0:
    print("Thank You")
else:
    print("\n \n \n \n Please again run the code and enter the correct choice !")   