class AddContestTypeToContests < ActiveRecord::Migration
  def up
    add_column :contests, :contest_type, :integer
  end
  def down
    remove_column :contests, :contest_type, :integer
  end
end
