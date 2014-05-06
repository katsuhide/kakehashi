App.module 'Trends', (Trends, App, Backbone) ->

	# Trend Model
	class Trends.Trend extends Backbone.Model
		default:
			tag: 'default'
			name: 'default'

	# Trend Collection
	class Trends.TrendList extends Backbone.Collection
		model: Trends.Trend
		url: 'api/daytrends'

		comparator: (model) ->
			switch App.KAKEHASHI.controller.period
				when 'day'
					model.get 'day_rank'
				when 'week'
					model.get 'week_rank'
				when 'month'
					model.get 'month_rank'
				when 'total'
					model.get 'total_rank'
				else
					model.get 'total_rank'
