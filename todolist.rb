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



list = TodoList.new
4.times { list.add_item }
