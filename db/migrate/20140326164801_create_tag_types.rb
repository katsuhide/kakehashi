class CreateTagTypes < ActiveRecord::Migration
  def change
    create_table :tag_types do |t|
      t.string :tag
      t.string :keyword
      t.string :name
      t.string :land_of_origin

      t.timestamps
    end
  end
end
