class DayTrendController < ApplicationController

	respond_to :json

	def list_daytrends(tag_type)
		today = Date.today()
		case tag_type
		when "sake" then
			# daytrends = DayTrend.where(base_date: today).joins(:keyword).select('*').order("day_trends.rank")
			daytrends = Keyword.joins(:sake, :search_condition, :day_trend).where(DayTrend.arel_table[:base_date].eq(today)).select('*').order("day_trends.total_rank")
		when "traditional" then
			daytrends = Keyword.joins(:traditional, :search_condition, :day_trend).where(DayTrend.arel_table[:base_date].eq(today)).select('*').order("day_trends.total_rank")
		else
			# defaultはとりあえず"sake"にしておく
			p "list default"
			daytrends = Keyword.joins(:sake, :search_condition, :day_trend).where(DayTrend.arel_table[:base_date].eq(today)).select('*').order("day_trends.total_rank")
		end
		return daytrends
	end

	def list
		tag_type = params[:tag_type]
		daytrends = list_daytrends(tag_type)
		respond_with daytrends
	end

	private
	# Never trust parameters from the scary internet, only allow the white list through.
	def trendlist_params
		params.require(:data).permit(:tag_type)
	end

end
