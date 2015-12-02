# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready((x)->
	console.log("ready")
	$("strong[data-sen-time]").on("tap", (e)->
		console.log("sentence "+$(this).data("sen-time").toString()+" onclick")
		audioDom = $("audio")[0]
		audioDom.pause()
		audioDom.currentTime = $(this).data("sen-time")/1000
		audioDom.play()
	)
	$(document).on("pagecontainerremove", (e,u)->
		console.log("page remove")
	)
	$(document).on("pagecontainerbeforehide", (e,u)->
		console.log("pagecontainerbeforehide")
	)
)

###
###
