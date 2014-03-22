class DayController < ApplicationController

	respond_to :json

	def list
		@days = Day.all
		respond_with @days
	end

end
