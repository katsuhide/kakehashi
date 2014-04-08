App.module 'KAKEHASHI', (KAKEHASHI, App, Backbone, Marionette, $, _) ->

	# Router
	KAKEHASHI.Router = Marionette.AppRouter.extend
		appRoutes:
			"*target": "showTarget"

	# Controller
	KAKEHASHI.Controller = ->
		@trendList = new App.Trends.TrendList()
		@

	# extend Controller
	_.extend KAKEHASHI.Controller.prototype,
		start: ->
			@showHeader @trendList
			@showTrendHeader()
			@showFooter @trendList
			@trendList.fetch()

		showHeader: (trendList) ->
			header = new App.Layout.Header
				collection: trendList

			App.header.show header

		showTrendHeader: ->
			trend_header = new App.Layout.TrendHeader

			App.trend_header.show trend_header

		showFooter: (trendList) ->
			footer = new App.Layout.Footer
				collection: trendList

			App.footer.show footer

		showMain: (trendList, target) ->
			switch target
				when 'table'
					App.main.show new KAKEHASHI.Views.TableListView
						collection: trendList
				else
					App.main.show new KAKEHASHI.Views.ListView
						collection: trendList

		showTarget: (target) ->
			@trendList.fetch()
			@showMain(@trendList, target)


	# Initialize
	KAKEHASHI.addInitializer ->
		controller = new KAKEHASHI.Controller()
		controller.router = new KAKEHASHI.Router
			controller: controller
		controller.start()
