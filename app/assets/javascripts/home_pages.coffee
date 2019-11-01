# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
    $('#typed-sample').typed
        strings: ['Student. ^800', 'Developer. ^800', 'Learner.^800']
        loop: true
        showCursor: false

$(document).on('turbolinks:load', ready)
