class AddUserIdToTodos < ActiveRecord::Migration[6.1]
  def up
    add_column :todos, :user_id, :integer
    add_index :todos, :user_id
  end

  def down 
    remove_index :todos, :user_id
    remove_column :todos, :user_id, :integer
  end
end
