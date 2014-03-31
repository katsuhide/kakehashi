class DayTrendController < ApplicationController

	respond_to :json

	def list
		today = Date.today()
		@daytrends = DayTrend.where(base_date: today).joins(:keyword).select('*').order("day_trends.total_count").reverse_order
		respond_with @daytrends
	end

end
