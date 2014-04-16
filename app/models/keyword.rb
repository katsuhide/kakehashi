class Keyword < ActiveRecord::Base
	has_one :search_condition
	has_one :sake
	has_many :trend
	has_many :day_trend
end
