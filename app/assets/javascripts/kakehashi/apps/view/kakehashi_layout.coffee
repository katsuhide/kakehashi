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
		ui:
			view_mode: '.view-mode i'
			bubble_btn: '#bubble_btn i'
			table_btn: '#table_btn i'

		onShow: ->
			$(document).foundation()
			@toggleViewModeBtn()

		toggleViewModeBtn: ->
			@ui.view_mode.addClass 'not-selected'
			view_mode = App.KAKEHASHI.controller.view_mode
			switch view_mode
				when 'bubble'
					@ui.bubble_btn.removeClass 'not-selected'
				when 'table'
					@ui.table_btn.removeClass 'not-selected'

		clickBubbleBtn: ->
			App.KAKEHASHI.controller.view_mode = 'bubble'
			@toggleViewModeBtn()
			App.KAKEHASHI.controller.showMain()

		clickTableBtn: ->
			App.KAKEHASHI.controller.view_mode = 'table'
			@toggleViewModeBtn()
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