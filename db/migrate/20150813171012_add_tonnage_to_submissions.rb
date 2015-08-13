class AddTonnageToSubmissions < ActiveRecord::Migration
  def up
    add_column :submissions, :tonnage, :decimal
  end
  def down
    remove_column :submissions, :tonnage, :decimal
  end
end
