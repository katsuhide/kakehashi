App.module 'KAKEHASHI.Views', (Views, App, Backbone, Marionette, $) ->
	# Trend List Item Views
	class Views.ItemView extends Marionette.ItemView
		tagName: 'tr'
		template: 'kakehashi/apps/templates/trend'

		templateHelpers :
			getImageURL: (model)->
				image_url_full = "assets/" + model['tag_type'] + "/" + model['image_url']

	# Item List View
	class Views.TableListView extends Backbone.Marionette.CompositeView
		template: 'kakehashi/apps/templates/trends'
		itemView: Views.ItemView
		itemViewContainer: '#trend-list'
