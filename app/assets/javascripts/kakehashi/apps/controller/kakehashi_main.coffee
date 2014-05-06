App.module 'KAKEHASHI', (KAKEHASHI, App, Backbone, Marionette, $, _) ->

	# Router
	KAKEHASHI.Router = Marionette.AppRouter.extend
		appRoutes:
			"*target": "showTarget"

	# Controller
	KAKEHASHI.Controller = ->
		@period = 'week'
		@view_mode = 'bubble'
		@trendList = new App.Trends.TrendList()
		@

	# extend Controller
	_.extend KAKEHASHI.Controller.prototype,
		start: ->
			@showHeader @trendList
			@showTopBar()
			@showTrendHeader()
			@showRightMenu()
			@showFooter @trendList
			@trendList.fetch()

		showHeader: (trendList) ->
			header = new App.Layout.Header
				collection: trendList

			App.header.show header

		showTopBar: ->
			top_bar = new App.Layout.TopBar

			App.top_bar.show top_bar

		showTrendHeader: ->
			trend_header = new App.Layout.TrendHeader

			App.trend_header.show trend_header

		showRightMenu: ->
			right_menu = new App.Layout.RightMenu

			App.right_menu.show right_menu

		showFooter: (trendList) ->
			footer = new App.Layout.Footer
				collection: trendList

			App.footer.show footer

		showMain: ->
			@trendList.sort()
			switch @.view_mode
				when 'table'
					App.main.show new KAKEHASHI.Views.TableListView
						collection: @trendList
				else
					App.main.show new KAKEHASHI.Views.ListView
						collection: @trendList

		showTarget: (tag_type) ->
			@trendList.fetch({
				data: {
					tag_type: tag_type
				}
			})
			# @showMain()

	# Initialize
	KAKEHASHI.addInitializer ->
		controller = new KAKEHASHI.Controller()
		controller.router = new KAKEHASHI.Router
			controller: controller
		@controller = controller
		controller.start()
