class DeleteColumnTraditionalTag < ActiveRecord::Migration
  def change
  	remove_column :traditionals, :tag
  end
end
