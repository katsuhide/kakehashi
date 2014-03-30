class DayTrendController < ApplicationController

	respond_to :json

	def list
		@daytrends = DayTrend.joins(:keyword).select('*').order("day_trends.total_count").reverse_order
		respond_with @daytrends
	end

end
