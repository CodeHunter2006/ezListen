# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# for websocket
readyFunc = -> 
	console.log("articles-show readyFunc")
	if $("#articles-show").length
		console.log("articles-show initial")
		lastAudioPosition = -1
		setAudioPosition = (time)->
			if lastAudioPosition != time
				$("strong[data-sen-time='"+time.toString()+"']").css("color", "red")
				$("strong[data-sen-time='"+lastAudioPosition.toString()+"']").css("color", "black")
				lastAudioPosition = time
		$("strong[data-sen-time]").on("tap", (e)->
			console.log("sentence "+$(this).data("sen-time").toString()+" onclick")
			audioDom = $("audio")[0]
			audioDom.pause()
			audioDom.currentTime = $(this).data("sen-time")/1000
			audioDom.play()
			setAudioPosition $(this).data("sen-time")
		)
		lastRefreshIndex = 0
		refreshAudioPosition = ->
			curPosition = $("audio")[0].currentTime*1000
			#console.log("audio position"+curPosition.toString())
			lastRefreshIndex = index for index in [0..sentenceTimeArray.length - 2] when sentenceTimeArray[index] <= curPosition && sentenceTimeArray[index + 1] > curPosition
			lastRefreshIndex = sentenceTimeArray.length - 1 if lastRefreshIndex >= sentenceTimeArray.length - 2 && sentenceTimeArray[lastRefreshIndex + 1] < curPosition 
			setAudioPosition sentenceTimeArray[lastRefreshIndex]
		refreshTimerId = null
		$("audio").on("play", ->
			refreshAudioPosition()
			refreshTimerId = setInterval(refreshAudioPosition, 500)
			console.log("audio play")
		)
		$("audio").on("pause", ->
			clearInterval(refreshTimerId)
			refreshTimerId = null
		)
		if $("audio").length
			$("audio")[0].play()
	# for websocket
	App.messages = App.cable.subscriptions.create 'MessagesChannel',
		received: (data) ->
			console.log("websocket received: "+data.id.toString())
			if ($("#status").data("target-id") == data.id && $("#status").text() != "Finished")
				console.log("refresh")
				location.reload(true)
setReadyCallback(readyFunc)
