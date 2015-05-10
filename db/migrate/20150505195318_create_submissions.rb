class CreateSubmissions < ActiveRecord::Migration
  def up
    create_table :submissions do |t|
      t.integer :reps
      t.decimal :weight
      t.integer :user_id
      t.integer :contest_id

      t.timestamps
    end
    add_index :submissions, :user_id
    add_index :submissions, :contest_id
  end

  def down
    drop_table :submissions
  end
end
