class AddSeveralCountColumnToDayTrends < ActiveRecord::Migration
  def change
  	add_column :day_trends, :day_count, :integer
  	add_column :day_trends, :week_count, :integer
  	add_column :day_trends, :month_count, :integer
  end
end
