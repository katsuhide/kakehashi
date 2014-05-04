class AddColumnSeveralRankingColumnToDayTrend < ActiveRecord::Migration
  def change
  	rename_column :day_trends, :rank, :total_rank
  	add_column :day_trends, :day_rank, :integer
  	add_column :day_trends, :week_rank, :integer
  	add_column :day_trends, :month_rank, :integer
  end
end
