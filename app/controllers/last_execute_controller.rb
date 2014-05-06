class LastExecuteController < ApplicationController
	respond_to :json

	def list
		respond_with LastExecute.all
	end
end
