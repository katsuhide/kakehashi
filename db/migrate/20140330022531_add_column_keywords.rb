class AddColumnKeywords < ActiveRecord::Migration
  def change
  	add_column :keywords, :since_id, :integer
  end
end
