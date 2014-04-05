App.module 'KAKEHASHI.Views', (Views, App, Backbone, Marionette, $) ->
	# Trend List Item Views
	class Views.ItemView extends Marionette.ItemView
		# tagName: 'tr'
		# template: 'kakehashi/apps/templates/trend'
		template: 'kakehashi/apps/templates/trend_bubble'

		modelEvents:
			'change': 'render'

		events:
			'click #trend': 'trendFunction'

		onShow: ->
			$("#trend-list").nested 'append', @

		trendFunction: ->
			console.log "hogeFunction"
			# $("#trend-list").nested {selector: '.box'}

		templateHelpers :
			getTooltipMsg: ->
				@createTooltipMsg()

			createTooltipMsg: ->
				"No." + @['rank'] + "-" + @['name'] + "@" + @['land_of_origin'] + ":" + @['total_count']

	# Item List View
	class Views.ListView extends Backbone.Marionette.CompositeView
		# template: 'kakehashi/apps/templates/trends'
		template: 'kakehashi/apps/templates/trends_bubble'
		itemView: Views.ItemView
		itemViewContainer: '#trend-list'

		collectionEvents:
			'all': 'someEvent'

		someEvent: ->
			# console.log "some event happends"

		update: ->
			# console.log "update"
