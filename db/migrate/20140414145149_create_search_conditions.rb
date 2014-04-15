class CreateSearchConditions < ActiveRecord::Migration
  def change
    create_table :search_conditions do |t|
      t.references :keyword, index: true
      t.string :search_word
      t.decimal :since_id

      t.timestamps
    end
  end
end
