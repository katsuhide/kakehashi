class DayController < ApplicationController

	respond_to :json

	def list
		# @days = Day.all
		@days = Day.joins("LEFT JOIN keywords ON keywords.tag = days.tag").select('*')
		respond_with @days
	end

end
