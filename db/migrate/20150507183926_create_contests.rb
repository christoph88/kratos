class CreateContests < ActiveRecord::Migration
  def up
    create_table :contests do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def down
    drop_table :contests
  end

end
