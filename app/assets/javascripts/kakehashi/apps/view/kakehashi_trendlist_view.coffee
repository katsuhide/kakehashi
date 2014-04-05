App.module 'KAKEHASHI.Views', (Views, App, Backbone, Marionette, $) ->
	# Trend List Item Views
	class Views.ItemView extends Marionette.ItemView
		tagName: 'tr'
		template: 'kakehashi/apps/templates/trend'

		modelEvents:
			'change': 'render'

		events:
			'click #hoge': 'hogeFunction'

		hogeFunction: ->
			alert "Hoge is hoge!"


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

		templateHelpers:
			getRank2: ->
				console.log "getRank2"
