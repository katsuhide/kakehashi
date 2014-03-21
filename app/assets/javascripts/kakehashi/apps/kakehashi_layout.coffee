App.module 'Layout', (Layout, App, Backbone) ->

	# Header
	class Layout.Header extends Backbone.Marionette.ItemView
		template: 'kakehashi/apps/templates/header'

	# Main
	class Layout.Main extends Backbone.Marionette.ItemView
		template: 'kakehashi/apps/templates/main'

		events:
			'click h1': 'onLogoClick'
			'click li': 'onLinkClick'

		onLogoClick: ->
			alert "Hello KAKEHASHI!!!"

		onLinkClick: ->
			console.log "onLinkClick"

	# Footer
	class Layout.Footer extends Backbone.Marionette.ItemView
		template: 'kakehashi/apps/templates/footer'