class AddBioToUsers < ActiveRecord::Migration
  def up
    add_column :users, :bio, :text
  end
  def downb
    remove_column :users, :bio
  end
end
