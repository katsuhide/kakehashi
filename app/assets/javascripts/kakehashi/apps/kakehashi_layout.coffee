App.module 'Layout', (Layout, App, Backbone) ->

	# Header
	class Layout.Header extends Backbone.Marionette.ItemView
		template: 'kakehashi/apps/templates/header'

		events:
			'click h1': 'onLogoClick'

		onLogoClick: ->
			alert "Hello KAKEHASHI!!!"


	# Footer
	class Layout.Footer extends Backbone.Marionette.ItemView
		template: 'kakehashi/apps/templates/footer'