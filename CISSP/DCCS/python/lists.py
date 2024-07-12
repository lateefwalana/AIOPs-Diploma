#!/usr/bin/python3
print("List of my favrouit frouits")
my_list = ["Lechee","Apple", "Banana", "Carrots"]
print(my_list)
print("Adding my next favoruit frouit")
my_list.append("Orange")
print(my_list)
print("Removing Banana from list")
my_list.remove("Banana")
print(my_list)
print("total number of fruits in the list")
print(len(my_list))
print("Sort alpabatically")
print(sorted(my_list))

# List of number 1 20
num_list = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
print(num_list)
#Print first 5 elements
print(num_list[0:5])
#Print the last 5 elements
print(num_list[-5:])
#Print all even numbers in the list
print(num_list[1::2])

#Better way of doing above

# Create a list of numbers from 1 to 20
numbers = list(range(1, 21))
print(numbers)
# Print the first five elements
print(numbers[:5])

# Print the last five elements
print(numbers[-5:])

# Print all the even numbers from the list
print(numbers[1::2])

# Print all the odd numbers from the list
print(numbers[0::2])
