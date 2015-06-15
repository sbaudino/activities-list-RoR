# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  # show alerts 
  $("#alerts").fadeIn()
  # hide spinner and overlay
  $('#overlay').hide()

# spinner and overlay triggers
$(document).on 'submit', 'form', ->
  $('#overlay').fadeIn(500)
$(document).ajaxStop ->
  $('#overlay').fadeOut(500)