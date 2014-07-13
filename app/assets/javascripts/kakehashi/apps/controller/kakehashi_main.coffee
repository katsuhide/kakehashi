App.module 'KAKEHASHI', (KAKEHASHI, App, Backbone, Marionette, $, _) ->

	# Router
	KAKEHASHI.Router = Marionette.AppRouter.extend
		appRoutes:
			"*target": "showTarget"

	# Controller
	KAKEHASHI.Controller = ->
		@period = 'week'
		@view_mode = 'grid'
		@tag_type = null
		@trendList = new App.Trends.TrendList()
		@lastExecuteList = new App.LastExecutes.LastExecuteList()
		@searchConditionList = new App.SearchConditions.SearchConditionList()
		@

	# extend Controller
	_.extend KAKEHASHI.Controller.prototype,
		start: ->
			@showHeader @trendList
			@showTopBar()
			@lastExecuteList.fetch()
			@searchConditionList.fetch()
			@showTrendHeader @lastExecuteList
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

		showTrendHeader: (lastExecuteList)->
			trend_header = new App.Layout.TrendHeader
				collection: lastExecuteList

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
				when 'bubble'
					main = new KAKEHASHI.Views.ListView
						collection: @trendList
				when 'table'
					main = new KAKEHASHI.Views.TableListView
						collection: @trendList
				when 'grid'
					main = new KAKEHASHI.Views.GridListView
						collection: @trendList
				else
					main = new KAKEHASHI.Views.GridListView
						collection: @trendList

			App.main.show main

		showTarget: (tag_type) ->
			@tag_type = tag_type
			@trendList.reset()	#collectionが更新される前に再描画してしまわないように明示的に空にする
			@trendList.fetch({
				data: {
					tag_type: @tag_type
					period: @period
				}
			})
			@showMain()

		resetIsotope: ->
			_.each $('#trend-list').isotope('getItemElements'), (elements) ->
				$('#trend-list').isotope 'remove', elements
			$('#trend-list').isotope 'layout'

	# Initialize
	KAKEHASHI.addInitializer ->
		controller = new KAKEHASHI.Controller()
		controller.router = new KAKEHASHI.Router
			controller: controller
		@controller = controller
		controller.start()
