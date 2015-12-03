# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on("pagechange", (e,u)->
	if $(u.toPage).attr("id").toString() == "articles-show"
		$("audio").on("canplay", ->
			console.log("canplay")
			$("audio")[0].play()
		)
	console.log("page change")
)
$(document).on("pagecreate", (e)->
	console.log("page create")
	if $(e.target).attr("id").toString() == "articles-show"
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
		lastRefreshIndex = -1
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
)
$(document).on("pagecontainerremove", (e,u)->
	console.log("page remove")
)
$(document).on("pagecontainerload", (e,u)->
	console.log("page load")
)
$(document).on("pagecontainerbeforehide", (e,u)->
	console.log("pagecontainerbeforehide")
	if $(u.prevPage).attr("id").toString() == "articles-show"
		$("audio")[0].pause()
)

###
###
