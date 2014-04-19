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

		showMain: (view_mode) ->
			switch view_mode
				when 'table'
					App.main.show new KAKEHASHI.Views.TableListView
						collection: @trendList
				else
					App.main.show new KAKEHASHI.Views.ListView
						collection: @trendList

		showTarget: (tag_type, view_mode) ->
			@trendList.fetch({
				data: {
					tag_type: tag_type
				}
			})
			@showMain(view_mode)

		changeViewMode: (view_mode) ->
			url = location.href
			tag_type = url.substring(url.lastIndexOf('#') + 1)
			@showTarget(tag_type, view_mode)

		test: ->
			@trendList.fetch({
				data : {
					tag_type : "sake"
				}
			})
			console.log @trendList

	# Initialize
	KAKEHASHI.addInitializer ->
		controller = new KAKEHASHI.Controller()
		controller.router = new KAKEHASHI.Router
			controller: controller
		controller.start()
