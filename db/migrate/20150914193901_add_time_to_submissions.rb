class AddTimeToSubmissions < ActiveRecord::Migration
  def up
    add_column :submissions, :time, :datetime
  end
  def down
    remove_column :submissions, :time, :datetime
  end
end
