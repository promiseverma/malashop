# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'change', '#material_unit', ->
	if $('#material_unit').val() == 'Line'
  	$('.material_piece_count').show()
  else
  	$('.material_piece_count').hide()
  return
