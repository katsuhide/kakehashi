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
			'click #grid_btn' :'clickGridBtn'
			'click #day_btn' :'clickDayBtn'
			'click #week_btn' :'clickWeekBtn'
			'click #month_btn' :'clickMonthBtn'
			'click #all_btn' :'clickAllBtn'
		ui:
			view_mode: '.view-mode i'
			bubble_btn: '#bubble_btn i'
			table_btn: '#table_btn i'
			grid_btn: '#grid_btn i'
			period: '.period i'
			day_btn: '#day_btn i'
			week_btn: '#week_btn i'
			month_btn: '#month_btn i'
			all_btn: '#all_btn i'

		onShow: ->
			$(document).foundation()
			@toggleViewModeBtn()
			@togglePeriodBtn()

		toggleViewModeBtn: ->
			@ui.view_mode.addClass 'not-selected'
			view_mode = App.KAKEHASHI.controller.view_mode
			switch view_mode
				when 'bubble'
					@ui.bubble_btn.removeClass 'not-selected'
				when 'table'
					@ui.table_btn.removeClass 'not-selected'
				when 'grid'
					@ui.grid_btn.removeClass 'not-selected'

		togglePeriodBtn: ->
			@ui.period.addClass 'not-selected'
			period = App.KAKEHASHI.controller.period
			switch period
				when 'day'
					@ui.day_btn.removeClass 'not-selected'
				when 'week'
					@ui.week_btn.removeClass 'not-selected'
				when 'month'
					@ui.month_btn.removeClass 'not-selected'
				when 'all'
					@ui.all_btn.removeClass 'not-selected'
				else
					@ui.week_btn.removeClass 'not-selected'
			App.KAKEHASHI.controller.showMain()

		clickBubbleBtn: ->
			App.KAKEHASHI.controller.view_mode = 'bubble'
			@toggleViewModeBtn()
			App.KAKEHASHI.controller.showMain()

		clickTableBtn: ->
			App.KAKEHASHI.controller.view_mode = 'table'
			@toggleViewModeBtn()
			App.KAKEHASHI.controller.showMain()

		clickGridBtn: ->
			App.KAKEHASHI.controller.view_mode = 'grid'
			@toggleViewModeBtn()
			App.KAKEHASHI.controller.showMain()

		clickDayBtn: ->
			App.KAKEHASHI.controller.period = 'day'
			@togglePeriodBtn()

		clickWeekBtn: ->
			App.KAKEHASHI.controller.period = 'week'
			@togglePeriodBtn()

		clickMonthBtn: ->
			App.KAKEHASHI.controller.period = 'month'
			@togglePeriodBtn()

		clickAllBtn: ->
			App.KAKEHASHI.controller.period = 'all'
			@togglePeriodBtn()

	# Trend Header
	class Layout.TrendHeader extends Backbone.Marionette.ItemView
		template: 'kakehashi/apps/templates/trend_header'
		events:
			'click #datasource-logo': 'clickLogo'

		onShow: ->
			$(document).foundation()

		clickLogo: ->
			console.log "click logo"
			App.main.destroy()
			# $('#trend-list').isotope('destroy')
			# App.removeRegion("main")
			# App.addRegions
			# 	main: '#main-contents'
			# console.log @.collection.models[0].get 'executed_time'
			# console.log App.KAKEHASHI.controller.searchConditionList.debug()

			# searchConditionList = new App.SearchConditions.SearchConditionList()
			# console.log searchConditionList.fetch().responseJSON

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