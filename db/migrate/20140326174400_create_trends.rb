class CreateTrends < ActiveRecord::Migration
  def change
    create_table :trends do |t|
      t.references :keyword, index: true
      t.integer :count
      t.datetime :search_datetime

      t.timestamps
    end
  end
end
