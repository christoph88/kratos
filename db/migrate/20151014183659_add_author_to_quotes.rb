class AddAuthorToQuotes < ActiveRecord::Migration
  def up
    add_column :quotes, :author, :string
  end
  def down
    remove_column :quotes, :author, :string
  end
end
