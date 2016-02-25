class TodoList
  attr_accessor :title, :items

  def initialize(list_title="My Todo List")
    @title = list_title
    @items = Array.new
  end

  def rename_list(new_title)
    @title = new_title
  end

  def add_item(description = "New Task #{(items.count + 1)}")
    new_item = Item.new(description)
    @items << new_item
  end

  def remove_item(item_position)
    @items.delete_at(item_position - 1) ? "Item #{item_position} removed successfully!" : "Oops, couldn't find that item to remove";
  end

  def toggle_complete(item_position)
    @items[item_position - 1].toggle_completed
  end

  def completed?(item_position)
    @items[item_position - 1].completed_status
  end

  # Printing Methods
  def print_header
    puts '######################################'
    puts "List: " + @title
    puts '######################################'
    puts
  end

  def generate_list
    list = Array.new
    i = 1
    @items.each do |item|
      status = item.completed_status ? ("Completed") : ("Incomplete")
      list << "#{ i }." + "\t" + "#{ item.description } \t\t (#{ status })"
      i += 1
    end
    return list
  end

  def print_items
    generate_list.each do |item|
      puts item
    end
  end

  def print_list
    print_header
    print_items
    2.times { puts }  #add visual spacing
  end

  # Zach's New Features
  def yolo(important_part_of_life = "QUIT YOUR JOB AND GO SURF IN COSTA RICA")
    @title = "LIFE'S TODO LIST"
    @items = []
    add_item(important_part_of_life)
    print_list
  end

  def remove_completed
    @items.delete_if { |item| item.completed_status == false }
  end

  def export_to_txt(path)
    # the paths should be a new name of a .txt file
    unless File.exist?(path)
      file = File.new(path, "w+")
    else
      file = File.open(path, "w+")
    end

    file.puts @title
    file.puts ""

    generate_list.each do |item|
      file.puts item
    end

    file.close

  end
end

class Item
  attr_accessor :description, :completed_status

  default_task = "New Task"

  def initialize(description = default_task)
    @description = description
    @completed_status = false
  end

  def toggle_completed
    @completed_status = !@completed_status
  end
end

def fake
  list = TodoList.new
  5.times { list.add_item }
  return list
end
