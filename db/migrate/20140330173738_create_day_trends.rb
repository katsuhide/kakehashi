class CreateDayTrends < ActiveRecord::Migration
  def change
    create_table :day_trends do |t|
      t.references :keyword, index: true
      t.integer :total_count
      t.date :base_date
      t.integer :rank

      t.timestamps
    end
  end
end
