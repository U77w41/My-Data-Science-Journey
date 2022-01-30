# Linked List

class Node:
    next: None

    def __init__(self, data=None,next=None):
        self.data = data
        self.next = next


class LinkedList:
    def __init__(self):
        self.head = None
        self.length = 0

    def insert_at_begining(self, data):
        newnode = Node(data)
        if self.head == None:
            self.head = newnode
        else:
            newnode.next = self.head
            self.head = newnode
        self.length += 1

    def insert_at_nth_position(self, data, k):
        if k < 2:
            self.insert_start(data)
        else:
            newnode = Node(data)
            current = self.head
            for _ in range(k - 1):
                current = current.next
            newnode.next = current.next
            current.next = newnode
            self.length += 1

    def insert_at_end(self, data):
        self.insert_k_pos(data, self.length)

    def pop_begining_element(self):
        if self.length == 0:
            print("List is empty ! \n Please Insert elements first")
        else:
            x = self.head.data
            self.head = self.head.next
            self.length -= 1
            print(x)

    def pop_ith_element(self, i):
        if i < 2:
            self.delete_start()
        else:
            current = self.head
            for _ in range(i - 2):
                current = current.next
            x = current.next.data
            current.next = current.next.next
            self.length -= 1
            print(x)

    def pop_Last_Element(self):
        self.delete_k_pos(self.length)

    def traversal(self):
        x = []
        current = self.head
        while current != None:
            x.append(current.data)
            current = current.next
        print("->".join([str(i) for i in x]), end="")


    def search(self, ser):
        current = self.head
        found = False
        for i in range(self.length):
            if current.data == ser:
                found = True
                break
            current = current.next
        print(f"Found {ser} at position {i + 1}") if found else print("Not Found")

    def reverse(self):
        previous = None
        current = self.head
        while current != None:
            temp = current.next
            current.next = previous
            previous = current
            current = temp
        self.head = previous

    def sort(self):
        current = self.head
        index = Node(None)
        if current == None:
            return
        else:
            while current != None:
                index = current.next
                while index is not None:
                    if current.data > index.data:
                        temp = current.data
                        current.data = index.data
                        index.data = temp
                    index = index.next
                current = current.next


if __name__ == "__main__":
    l1 = LinkedList()
    while True:
        print(" \n \n Menu \n \n")

        print("1. Insert at begining of list")

        print("2.Insert at the end of list")

        print("3.Insert at any index ")

        print("4.Pop the begining element")

        print("5.Pop k-th element")

        print("6.Pop last element")

        print("7.Print/Traverse the Linked List")

        print("8.Perform Sorting Operation")

        print("9.Perform Reversal Operation")

        print("0.Exit")

        option= int(input("Enter your Choice: \n"))
        if option == 1:
            y = int(input("Enter element to insert: \n"))
            l1.insert_at_begining(y)
        elif option == 3:
            y = int(input("Enter element to insert: \n"))
            k = int(input("Enter the position: \n"))
            if k > l1.length + 1:
                print("Please use a samller index \n")
            else:
                l1.insert_at_nth_position(y, k)
        elif option == 2:
            y = int(input("Enter element to insert: \n"))
            l1.insert_at_end(y)
        elif option == 4:
            l1.pop_begining_element()
        elif option == 5:
            i = int(input("Enter the position you want to delete: "))
            if i > l1.length:
                print("Please try a smaller index \n")
            else:
                l1.Pop_ith_element(i)
        elif option == 6:
            l1.pop_Last_Element()
        elif option == 7:
            l1.traversal()

        elif option == 9:
            l1.reverse()
        elif option == 8:
            l1.sort()
        elif option == 0:
            print("Thank You\n")
            break
        else:
            print("Wrong Option ! \n, Please Choose the correct option\n")
