class AddImageUrlColumnKeywords < ActiveRecord::Migration
  def change
  	add_column :keywords, :image_url, :string
  end
end
