require_relative 'todolist.rb'

# Creates a new todo list
list = TodoList.new

# Add four new items
4.times { list.add_item }

# Print the list
list.print_list

# Delete the first item
list.remove_item(1)

# Print the list
list.print_list

# Delete the second item

# Print the list

# Update the completion status of the first item to complete

# Print the list

# Update the title of the list

# Print the list
