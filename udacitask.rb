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
list.remove_item(2)

# Print the list
list.print_list

# Update the completion status of the first item to complete
list.toggle_complete(1)

# Print the list
list.print_list

# Update the title of the list
list.rename_list("New List Name")

# Print the list
list.print_list
