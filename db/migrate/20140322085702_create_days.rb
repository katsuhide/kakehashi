class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.string :type
      t.string :tag
      t.string :name
      t.integer :count
      t.date :base_date

      t.timestamps
    end
  end
end
