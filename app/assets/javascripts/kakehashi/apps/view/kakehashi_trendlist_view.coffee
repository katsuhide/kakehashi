App.module 'KAKEHASHI.Views', (Views, App, Backbone, Marionette, $) ->
	# Trend List Item Views
	class Views.ItemView extends Marionette.ItemView
		# tagName: 'tr'
		# template: 'kakehashi/apps/templates/trend'
		template: 'kakehashi/apps/templates/trend_bubble'

		modelEvents:
			'change': 'render'

		events:
			'click #trend': 'trendFunction'
			# 'mouseover #trend': 'initTooltip'

		initTooltip: ->
			$("#bubble-#{@model.get 'rank'}").tooltipster(
				content: $('<span><strong>' + @createTooltipMsg() + '</strong></span>')
				)
			# $(document).foundation()
			# bubble_id = '#bubble-' +  @model.get 'rank'
			# $(document).foundation
  	# 		tooltips:
  	# 			selector : bubble_id
  	# 			tooltip_class : '.tooltip'
  	# 			tip_template : (selector, content) ->
			#       '<span data-selector="' + selector + '" class="' + Foundation.libs.tooltips.settings.tooltipClass.substring(1) + '">' + content + '<span class="nub"></span></span>'

		onShow: ->
			$("#trend-list").nested 'append', @
			@initTooltip()

		trendFunction: ->
			console.log "trendFunction"
			# $("#trend-list").nested {selector: '.box'}

			# @initTooltip()
			# $("#trend-list").nested {selector: '.box'}

		createTooltipMsg: ->
			rank = @model.get 'rank'
			name = @model.get 'name'
			origin = @model.get 'land_of_origin'
			total_count = @model.get 'total_count'
			msg = 'No.' + rank + '</br>' + name + ' @ ' + origin + '</br><i class="fa fa-twitter fa-lg"></i>' + total_count

		templateHelpers :
			getTooltipMsg: ->
				@createTooltipMsg2()

			createTooltipMsg2: ->
				"No." + @['rank'] + "-" + @['name'] + "@" + @['land_of_origin'] + ":" + @['total_count']

	# Item List View
	class Views.ListView extends Backbone.Marionette.CompositeView
		# template: 'kakehashi/apps/templates/trends'
		template: 'kakehashi/apps/templates/trends_bubble'
		itemView: Views.ItemView
		itemViewContainer: '#trend-list'

		collectionEvents:
			'all': 'someEvent'

		onShow: ->
			$(document).foundation()

		someEvent: ->
			# console.log "some event happends"

		update: ->
			# console.log "update"
