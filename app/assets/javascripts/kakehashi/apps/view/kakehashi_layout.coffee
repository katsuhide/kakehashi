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
			'click #datasource-logo': 'clickLogo'

		onShow: ->
			$(document).foundation()

		clickLogo: ->
			controller = new App.KAKEHASHI.Controller()
			controller.test()


	# Footer
	class Layout.Footer extends Backbone.Marionette.ItemView

		template: 'kakehashi/apps/templates/footer'

		onShow: ->
			# $(document).foundation()