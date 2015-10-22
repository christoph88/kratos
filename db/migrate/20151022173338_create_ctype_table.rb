class CreateCtypeTable < ActiveRecord::Migration
  def up
    create_table :ctypes do |t|
      t.string :name
      t.text :desc
    end
  end
  def down
    drop_table :ctypes
  end
end
