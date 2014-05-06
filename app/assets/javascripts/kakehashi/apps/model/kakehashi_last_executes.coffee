App.module 'LastExecutes', (LastExecutes, App, Backbone) ->

	# Model
	class LastExecutes.LastExecute extends Backbone.Model

	# Collection
	class LastExecutes.LastExecuteList extends Backbone.Collection
		model: LastExecutes.LastExecute
		url: 'api/lastexecutes'
