# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready((x)->
	$("strong[data-sen-time]").click (e)->
		console.log("sentence "+$(this).data("sen-time")+" onclick")
		audioDom = $("audio")[0]
		audioDom.pause()
		audioDom.currentTime = $(this).data("sen-time")/1000
		audioDom.play()
	console.log(sentenceTimeArray)
)
