App.module 'KAKEHASHI.Views', (Views, App, Backbone, Marionette, $) ->
	# Trend List Item Views
	class Views.ItemView extends Marionette.ItemView
		template: 'kakehashi/apps/templates/trend_bubble'

		modelEvents:
			'change': 'render'

		initTooltip: ->
			$("#bubble-#{@model.get 'keyword_id'}").tooltipster(
				content: $('<span><strong>' + @createTooltipMsg() + '</strong></span>')
				)

		onShow: ->
			$("#trend-list").nested 'append'
			@initTooltip()

		getCount: ->
			switch App.KAKEHASHI.controller.period
				when 'week'
					count = @model.get 'week_count'
				when 'month'
					count = @model.get 'month_count'
				when 'all'
					count = @model.get 'total_count'
				else
					count = @model.get 'total_count'

		getRank: ->
			switch App.KAKEHASHI.controller.period
				when 'week'
					rank = @model.get 'week_rank'
				when 'month'
					rank = @model.get 'month_rank'
				when 'all'
					rank = @model.get 'total_rank'
				else
					rank = @model.get 'total_rank'

		createTooltipMsg: ->
			tag_type = @model.get 'tag_type'
			rank = @getRank()
			name = @model.get 'name'
			origin = @model.get 'land_of_origin'
			count = @getCount()
			msg = 'No.' + rank + '</br>'
			switch tag_type
				when 'sake', 'traditional'
					msg += name + ' @ ' + origin + '</br>'
				when 'anime'
					msg += name + '</br>'
				else
					msg += name + '</br>'
			msg += '<i class="fa fa-twitter fa-lg"></i>' + count

		templateHelpers :
			getImageURL: (model)->
				image_url_full = "assets/" + model['tag_type'] + "/" + model['image_url']

			getRank: (model)->
				switch App.KAKEHASHI.controller.period
					when 'week'
						rank = model['week_rank']
					when 'month'
						rank = model['month_rank']
					when 'all'
						rank = model['total_rank']
					else
						rank = model['total_rank']

	# Item List View
	class Views.ListView extends Backbone.Marionette.CompositeView
		template: 'kakehashi/apps/templates/trends_bubble'
		itemView: Views.ItemView
		itemViewContainer: '#trend-list'

		onShow: ->
			$(document).foundation()