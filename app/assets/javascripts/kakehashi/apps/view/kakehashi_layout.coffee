App.module 'Layout', (Layout, App, Backbone) ->

	# Header
	class Layout.Header extends Backbone.Marionette.ItemView

		template: 'kakehashi/apps/templates/header'

		onShow: ->
			$(document).foundation()

	# Trend Header
	class Layout.TrendHeader extends Backbone.Marionette.ItemView

		template: 'kakehashi/apps/templates/trend_header'

		events:
			'click #bubble_btn': 'clickBubbleBtn'
			'click #table_btn': 'clickTableBtn'

		onShow: ->
			$(document).foundation()

		clickBubbleBtn: ->
			controller = new App.KAKEHASHI.Controller()
			controller.showTarget('bubble')

		clickTableBtn: ->
			controller = new App.KAKEHASHI.Controller()
			controller.showTarget('table')

	# Footer
	class Layout.Footer extends Backbone.Marionette.ItemView

		template: 'kakehashi/apps/templates/footer'

		onShow: ->
			# $(document).foundation()