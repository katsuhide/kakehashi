class RenameTypeToTagType < ActiveRecord::Migration
  def change
  	rename_column :days, :type, :tag_type
  end
end
