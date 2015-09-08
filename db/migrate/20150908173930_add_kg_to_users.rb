class AddKgToUsers < ActiveRecord::Migration
  def up
    add_column :users, :kg, :boolean
  end
  def down
    remove_column :users, :kg, :boolean
  end
end
