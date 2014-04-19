App.module 'KAKEHASHI.Views', (Views, App, Backbone, Marionette, $) ->
	# Trend List Item Views
	class Views.ItemView extends Marionette.ItemView
		template: 'kakehashi/apps/templates/trend_bubble'

		modelEvents:
			'change': 'render'

		events:
			'click #trend': 'clickTrend'

		initTooltip: ->
			$("#bubble-#{@model.get 'keyword_id'}").tooltipster(
				content: $('<span><strong>' + @createTooltipMsg() + '</strong></span>')
				)

		onShow: ->
			$("#trend-list").nested 'append'
			@initTooltip()

		clickTrend: ->
			console.log "click trend"

		createTooltipMsg: ->
			rank = @model.get 'rank'
			name = @model.get 'name'
			origin = @model.get 'land_of_origin'
			total_count = @model.get 'total_count'
			msg = 'No.' + rank + '</br>' + name + ' @ ' + origin + '</br><i class="fa fa-twitter fa-lg"></i>' + total_count

		templateHelpers :
			getImageURL: (model)->
				image_url_full = "assets/" + model['tag_type'] + "/" + model['image_url']

			getTooltipMsg: ->
				@createTooltipMsg2()

			createTooltipMsg2: ->
				"No." + @['rank'] + "-" + @['name'] + "@" + @['land_of_origin'] + ":" + @['total_count']

	# Item List View
	class Views.ListView extends Backbone.Marionette.CompositeView
		template: 'kakehashi/apps/templates/trends_bubble'
		itemView: Views.ItemView
		itemViewContainer: '#trend-list'

		onShow: ->
			$(document).foundation()
