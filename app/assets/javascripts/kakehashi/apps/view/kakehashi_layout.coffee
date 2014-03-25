App.module 'Layout', (Layout, App, Backbone) ->

	# Header
	class Layout.Header extends Backbone.Marionette.ItemView

		template: 'kakehashi/apps/templates/header'


	# Main
	# class Layout.Main extends Backbone.Marionette.ItemView
	# 	template: 'kakehashi/apps/templates/main'

	# Footer
	class Layout.Footer extends Backbone.Marionette.ItemView

		template: 'kakehashi/apps/templates/footer'

		collectionEvents:
			'all': 'render'

		initialize: ->
			# console.log "footer initialize"

		serializeData: ->
			# console.log "footer serializeData"
			total = @collection.length
			@completedCount(total)

		completedCount: (total)->
			totalCount: total

		getTotalCount: ->
			@collection.length

		templateHelpers:
			countList: ->
				console.log "footer:" + @getTotalCount


