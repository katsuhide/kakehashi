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

