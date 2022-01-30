# Linked List

# Define Node class
class Node:
	type = "Node"
	def __init__(self, value):
		self._value = value
		self._next = None

# Define LinkedList class
class LinkedList:
	type = "LinkedList"
	def __init__(self):
		self._head = None
		self._size = 0

	# (1) -------- INSERTING A NODE WITH DATA --------
	# Step-1: At the begining
	# Create new node >> new node next = llist head >> llist head = new node
	def addFirstInsert(self, value):
		newest = Node(value)
		newest._next = self._head
		self._head = newest
		self._size += 1
	# Step-2: Insert node at the tail
	# Create new node >> new node next = None >> llist tail next = new node >> llist next = new node
	def addLastInsert(self, value):
		newest = Node(value)
		if self._head is None:
			self._head = newest
			return
		else:
			temp = self._head
			while temp._next is not None:
				temp = temp._next
			temp._next = newest

	# Step-3: Insert after given node
	def betweenInsert(self, pos, value):
		pos = pos - 1
		newest = Node(value)
		current = self._head
		if pos > self._size:
			return "Linked list size is {}. Please give correct position.".format(self._size)
		else:
			count = 1
			while count < pos:
				if current is None:
					return "Empty Linked List"
				else:
					current = current._next
					count += 1
			newest._next = current._next
			current._next = newest

	# (2) -------- SEARCHING --------
	def searching(self, item):
		current = self._head
		pos = 1
		if current == None:
			return
		else:
			while current != None:
				if current._value == item:
					return "Item {} is found at {}th position.".format(item,current)
				pos += 1
				current = current._next
			print("Item not found!")

	# (3) -------- SORTING --------
	def sorting(self, desc = True):
		current = self._head
		temp = Node(None)
		if current != None:
			return "Empty Linked List"
		else:
			while current != None:
				temp = current._next
				while temp != None:
					if current._value > temp._value:
						current._value, temp._value = temp._value, current._value
					temp = temp._next
				current = current._next

	# (4) -------- REVERSE --------
	def reverse(self):
		front = None
		current = self._head
		while current != None:
			back = current._next
			current._next = front
			front = current
			current = back
		self._head = front

	# (5) -------- TRAVERSAL -------
	def traversal(self):
		current = self._head
		if current == None:
			print("Linked List is empty")
		else:
			print("Linked List is: ", end = " ")
			while current != None:
				print(current._value, end = " ")
				current = current._next
			print()

	# (6) --------- DELETE A NODE ------------
	def deleteing(self, pos):
		if self._head is None:
			return
		if pos == 0:
			self._head = self._head._next
			return self._head
		index = 0
		current = self._head
		prev = self._head
		temp = self._head
		while current is not None:
			if index == pos:
				temp = current._next
				break

if __name__ == "__main__":
	response = True
	llist = LinkedList()
	while response:
		print("\t::::::::::::::::<<< MENU >>>::::::::::::::::")
		print('''\t 1. Insertion \t 2. Search \t 3. Sorting \n\t 4. Reverse \t 5. Traversal \t 6. Deletion \n\t__________________ 7. Exit __________________\n''')
		choice = input("Enter choice: ")
		if choice == '1':
			new_value = int(input("Enter new value: "))
			print("::::: SUB MENU (Insertion) :::::")
			print(''' 1(a): At Start \n 1(b): At Anywhere \n 1(c): At End ''')
			choice = input("Choose (a/b/c): ")
			if choice == 'a':
				llist.addFirstInsert(new_value)
				llist.traversal()
			elif choice == 'b':
				pos = int(input("Enter the position: "))
				llist.betweenInsert(pos, new_value)
				llist.traversal()
			elif choice == 'c':
				llist.addLastInsert(new_value)
				llist.traversal()
			else:
				print('Wrong Input!')
			continue
		elif choice == '2':
			item = int(input("Enter the item to be searched: "))
			llist.searching(item)
			llist.traversal()
		elif choice == '3':
			llist.sorting()
			llist.traversal()
		elif choice == '4':
			llist.reverse()
			llist.traversal()
		elif choice == '5':
			llist.traversal()
		elif choice == '6':
			pos = int(input("Enter the position: "))
			llist.deleteing(pos)
		elif choice == '7':
			response = False
		else:
			print("Invalid choice! Try again!")
