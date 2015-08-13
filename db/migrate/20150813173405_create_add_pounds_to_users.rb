class CreateAddPoundsToUsers < ActiveRecord::Migration
  def change
    create_table :add_pounds_to_users do |t|
      t.boolean :pounds

      t.timestamps
    end
  end
end
