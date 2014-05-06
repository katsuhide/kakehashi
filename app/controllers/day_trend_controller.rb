class DayTrendController < ApplicationController

	respond_to :json

	def list_daytrends(tag_type, period)
		today = Date.today()
		sort_column = 'day_trends.'
		case period
		when 'day' then
			sort_column += 'day_rank'
		when 'week' then
			sort_column += 'week_rank'
		when 'month' then
			sort_column += 'month_rank'
		else
			sort_column += 'total_rank'
		end

		case tag_type
		when "sake" then
			# daytrends = DayTrend.where(base_date: today).joins(:keyword).select('*').order("day_trends.rank")
			daytrends = Keyword.joins(:sake, :search_condition, :day_trend).where(DayTrend.arel_table[:base_date].eq(today)).select('*').order(sort_column)
		when "traditional" then
			daytrends = Keyword.joins(:traditional, :search_condition, :day_trend).where(DayTrend.arel_table[:base_date].eq(today)).select('*').order(sort_column)
		when "anime" then
			daytrends = Keyword.where(tag_type:'anime').joins(:search_condition, :day_trend).where(DayTrend.arel_table[:base_date].eq(today)).select('*').order(sort_column)
		else
			# defaultはとりあえず"sake"にしておく
			p "list default"
			daytrends = Keyword.joins(:sake, :search_condition, :day_trend).where(DayTrend.arel_table[:base_date].eq(today)).select('*').order(sort_column)
		end
		return daytrends
	end

	def list
		tag_type = params[:tag_type]
		period = params[:period]
		daytrends = list_daytrends(tag_type, period)
		respond_with daytrends
	end

	private
	# Never trust parameters from the scary internet, only allow the white list through.
	def trendlist_params
		params.require(:data).permit(:tag_type, :period)
	end

end
