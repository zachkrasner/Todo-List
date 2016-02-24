class TodoList
  attr_accessor :title, :items

  def initialize(list_title)
    @title = list_title
    @items = Array.new
  end

  def add_new_item(description)
    new_item = Item.new(description)
    @items << new_item
  end
end

class Item
  attr_accessor :description, :completed_status

  default_task = "New Task"

  def initialize(description = default_task)
    @description = description
    @completed_status = false
  end
end
