# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery
#= require jquery_ujs
#= require jquery.tap
#= require turbolinks
#= require cable
#= require_self
#= require_tree .
$(document).on('page:change', (data)->
	console.log("page:change to: " + data.target.body.id)
	invokePageChange(data.target.body.id)
)
$(document).on('page:before-unload', (data)->
	console.log("page:before-unload: " + data.target.body.id)
	invokePageUnload(data.target.body.id)
)
@initCallbackArray = []
@setPageCallbacks = (bodyId, init, dispose)->
	initCallbackArray[bodyId] = {init: init, dispose: dispose}
@invokePageChange = (bodyId)->
	tarObj = initCallbackArray[bodyId]
	if tarObj != undefined && tarObj.init != undefined
		tarObj.init()
@invokePageUnload = (bodyId)->
	tarObj = initCallbackArray[bodyId]
	if tarObj != undefined && tarObj.dispose != undefined
		tarObj.dispose()
@App = {}
App.cable = Cable.createConsumer('ws://' + window.location.hostname + ':28080')

