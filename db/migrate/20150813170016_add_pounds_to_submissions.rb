class AddPoundsToSubmissions < ActiveRecord::Migration
  def up
    add_column :submissions, :pounds, :boolean
  end
  def down
    remove_column :submissions, :pounds, :boolean
  end
end
