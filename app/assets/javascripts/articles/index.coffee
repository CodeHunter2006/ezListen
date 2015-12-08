# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
readyFunc = -> 
	console.log("articles-index readyFunc")
	if $("#articles-index").length
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
		App.messages = App.cable.subscriptions.create 'NewArticleChannel',
			received: refreshPageCallback
setReadyCallback(readyFunc)
