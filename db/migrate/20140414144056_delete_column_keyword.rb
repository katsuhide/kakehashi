class DeleteColumnKeyword < ActiveRecord::Migration
  def change
  	remove_column :keywords, :since_id
  	remove_column :keywords, :search_word
  	remove_column :keywords, :land_of_origin
  end
end
