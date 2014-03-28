class DropTableTagType < ActiveRecord::Migration
  def change
  	drop_table :tag_types
  end
end
