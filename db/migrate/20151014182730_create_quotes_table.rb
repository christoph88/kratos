class CreateQuotesTable < ActiveRecord::Migration
  def up
    create_table :quotes do |t|
      t.text :text
    end
  end
  def down
    drop_table :quotes
  end
end
