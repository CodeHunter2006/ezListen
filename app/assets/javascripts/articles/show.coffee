# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready((x)->
	onTouchStart = (e)->
#		alert("on touch start")
		console.log("sentence "+$(this).data("sen-time")+" on touch")
		e.cancelBubble = true
		audioDom = $("audio")[0]
		audioDom.pause()
		audioDom.currentTime = $(this).data("sen-time")/1000
		audioDom.play()
	$("strong[data-sen-time]").each((index, element)->
		element.addEventListener('touchstart', onTouchStart, false)
	)
	onClickStart = (e)->
#		alert("on touch start")
		console.log("sentence "+$(this).data("sen-time")+" onclick")
		e.cancelBubble = true
		audioDom = $("audio")[0]
		audioDom.pause()
		audioDom.currentTime = $(this).data("sen-time")/1000
		audioDom.play()
	$("strong[data-sen-time]").each((index, element)->
		element.addEventListener('touchstart', onClickStart, false)
	)

)
###
	$("strong[data-sen-time]").click (e)->
		console.log("sentence "+$(this).data("sen-time")+" onclick")
		audioDom = $("audio")[0]
		audioDom.pause()
		audioDom.currentTime = $(this).data("sen-time")/1000
		audioDom.play()
	console.log("show start")
###
