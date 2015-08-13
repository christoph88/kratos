class CreateAddContestTypeToContests < ActiveRecord::Migration
  def change
    create_table :add_contest_type_to_contests do |t|
      t.integer :contest_type

      t.timestamps
    end
  end
end
