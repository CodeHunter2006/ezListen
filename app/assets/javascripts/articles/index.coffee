# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
setPageCallbacks "articles-index", ->
	console.log("articles-index initial")
	refreshPageCallback = (data) ->
		setTimeout( ->
			console.log("websocket received: "+data.id.toString())
			console.log("refresh")
			location.reload(true)
		, 300
		)
	App.messages = App.cable.subscriptions.create 'MessagesChannel',
		received: refreshPageCallback
	App.newarticle = App.cable.subscriptions.create 'NewArticleChannel',
		received: refreshPageCallback
, ->
	console.log("index dispose called")
	App.cable.subscriptions.remove App.messages
	App.cable.subscriptions.remove App.newarticle
