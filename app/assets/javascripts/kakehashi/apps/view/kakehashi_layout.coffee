App.module 'Layout', (Layout, App, Backbone, Marionette, $, _) ->

	# Header
	class Layout.Header extends Backbone.Marionette.ItemView
		template: 'kakehashi/apps/templates/header'

		onShow: ->
			$(document).foundation()

	# Top Bar
	class Layout.TopBar extends Backbone.Marionette.ItemView
		template: 'kakehashi/apps/templates/top_bar'
		events:
			'click #bubble_btn' :'clickBubbleBtn'
			'click #table_btn' :'clickTableBtn'

		onShow: ->
			$(document).foundation()

		clickBubbleBtn: ->
			App.KAKEHASHI.controller.showMain('bubble')

		clickTableBtn: ->
			# controller = new App.KAKEHASHI.Controller()
			# controller.changeViewMode('table')
			App.KAKEHASHI.controller.showMain('table')

	# Trend Header
	class Layout.TrendHeader extends Backbone.Marionette.ItemView
		template: 'kakehashi/apps/templates/trend_header'
		events:
			'click #datasource-logo': 'clickLogo'

		onShow: ->
			$(document).foundation()

		clickLogo: ->
			console.log "click logo"

	# Right Menu
	class Layout.RightMenu extends Backbone.Marionette.ItemView
		template: 'kakehashi/apps/templates/right_menu'

		onShow: ->
			$(document).foundation()

	# Footer
	class Layout.Footer extends Backbone.Marionette.ItemView
		template: 'kakehashi/apps/templates/footer'

		onShow: ->
			# $(document).foundation()