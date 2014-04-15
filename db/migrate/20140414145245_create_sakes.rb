class CreateSakes < ActiveRecord::Migration
  def change
    create_table :sakes do |t|
      t.references :keyword, index: true
      t.string :land_of_origin

      t.timestamps
    end
  end
end
