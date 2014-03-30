class RenameKeywordToSearchWord < ActiveRecord::Migration
  def change
		rename_column :keywords, :keyword, :search_word
  end
end
