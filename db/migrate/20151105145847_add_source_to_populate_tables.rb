class AddSourceToPopulateTables < ActiveRecord::Migration
  AFFECTED_TABLES = [:users, :contests, :submissions]

  def up
    AFFECTED_TABLES.each do |table_name|
      add_column table_name, :data_source, :string
    end
  end

  def down
    AFFECTED_TABLES.each do |table_name|
      remove_column table_name, :data_source, :string
    end
  end
end
