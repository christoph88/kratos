class AddAdminIdToContests < ActiveRecord::Migration
  def up
    add_column :contests, :admin_id, :integer
  end

  def down
    remove_column :contests, :admin_id
  end
end
