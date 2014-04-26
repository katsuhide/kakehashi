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
			App.KAKEHASHI.controller.view_mode = 'bubble'
			App.KAKEHASHI.controller.showMain()

		clickTableBtn: ->
			App.KAKEHASHI.controller.view_mode = 'table'
			App.KAKEHASHI.controller.showMain()

	# Trend Header
	class Layout.TrendHeader extends Backbone.Marionette.ItemView
		template: 'kakehashi/apps/templates/trend_header'
		events:
			'click #datasource-logo': 'clickLogo'

		onShow: ->
			$(document).foundation()

		clickLogo: ->
			console.log App.KAKEHASHI.controller.period
			console.log App.KAKEHASHI.controller.view_mode

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