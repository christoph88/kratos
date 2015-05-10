class AddFirstnameToUsers < ActiveRecord::Migration
  def up
    add_column :users, :firstname, :string
  end
  def down
    remove_column :users, :firstname
  end
end
