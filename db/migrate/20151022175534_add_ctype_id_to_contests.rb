class AddCtypeIdToContests < ActiveRecord::Migration
  def up
    add_column :contests, :ctype_id, :integer
  end
  def down
    remove_column :contests, :ctype_id, :integer
  end
end
