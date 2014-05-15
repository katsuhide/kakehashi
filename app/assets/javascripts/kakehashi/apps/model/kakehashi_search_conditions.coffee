App.module 'SearchConditions', (SearchConditions, App, Backbone) ->

	# Model
	class SearchConditions.SearchCondition extends Backbone.Model

	# Collection
	class SearchConditions.SearchConditionList extends Backbone.Collection
		model: SearchConditions.SearchCondition
		url: 'api/search_conditions'

		debug: ->
			console.log JSON.stringify @