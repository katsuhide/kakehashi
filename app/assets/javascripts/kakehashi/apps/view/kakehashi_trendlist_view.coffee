App.module 'KAKEHASHI.Views', (Views, App, Backbone, Marionette, $) ->
	# Trend List Item Views
	class Views.ItemView extends Marionette.ItemView
		# tagName: 'tr'
		tagName: 'div class="box size11"'
		# template: 'kakehashi/apps/templates/trend'
		template: 'kakehashi/apps/templates/trend_bubble'

		modelEvents:
			'change': 'render'

		events:
			'click #hoge': 'hogeFunction'

		onShow: ->
			$("#trend-list").nested 'append', @

		hogeFunction: ->
			console.log "Hoge is hoge!"
			# $("#trend-list").nested {selector: '.box'}

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
