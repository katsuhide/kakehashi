class SearchConditionController < ApplicationController
	respond_to :json

	def list
		respond_with SearchCondition.all.order('updated_at')
	end
end
