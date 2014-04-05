class ChengeColumnSinceIdToDecimal < ActiveRecord::Migration
  def change
  	change_column :keywords, :since_id, :decimal
  end
end
