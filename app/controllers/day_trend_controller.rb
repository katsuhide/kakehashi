class DayTrendController < ApplicationController

	respond_to :json

	def list_daytrends(tag_type)
		today = Date.today()
		case tag_type
		when "sake" then
			p "list sake"
			daytrends = DayTrend.where(base_date: today).joins(:keyword).select('*').order("day_trends.rank")
		else
			# defaultはとりあえず"sake"にしておく
			p "list default"
			daytrends = DayTrend.where(base_date: today).joins(:keyword).select('*').order("day_trends.rank")
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
