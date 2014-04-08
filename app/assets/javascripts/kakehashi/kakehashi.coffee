# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

App = window.App = new Backbone.Marionette.Application()

App.addRegions
	header: '#header'
	trend_header: '#trend-header'
	main: '#main-contents'
	footer: '#footer'

App.on 'initialize:after', ->
	if !Backbone.History.started
		Backbone.history.start()

App