class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.string :tag_type
      t.string :tag
      t.string :keyword
      t.string :name
      t.string :land_of_origin

      t.timestamps
    end
  end
end
