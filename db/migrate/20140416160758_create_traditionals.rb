class CreateTraditionals < ActiveRecord::Migration
  def change
    create_table :traditionals do |t|
      t.references :keyword, index: true
      t.string :tag
      t.string :land_of_origin

      t.timestamps
    end
  end
end
