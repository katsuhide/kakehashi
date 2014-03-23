App.module 'KAKEHASHI.Views', (Views, App, Backbone, Marionette, $) ->
	# Trend List Item Views
	class Views.ItemView extends Marionette.ItemView
		tagName: 'tr'
		template: 'kakehashi/apps/templates/trend'

		modelEvents:
			'change': 'render'

		templateHelpers:
			getRank: ->
				console.log "todo ここからリストなんて取得できない？"

	# Item List View
	class Views.ListView extends Backbone.Marionette.CompositeView
			template: 'kakehashi/apps/templates/trends'
			itemView: Views.ItemView
			itemViewContainer: '#trend-list'

			collectionEvents:
				'all': 'update'

			onRender: ->
				@update

			update: ->

