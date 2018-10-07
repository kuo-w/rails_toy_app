class TodoList < ApplicationRecord
  has_many :todo_items, :dependent => :delete_all 
  validates :title, presence: true
  validates :description, presence: true
            

end
