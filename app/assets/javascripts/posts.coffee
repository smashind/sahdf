# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "page:change", ->
	$('#show-post-form').click (e) ->
	  e.preventDefault()
	  $('#post-form').slideToggle ->
	    $('#post_body').focus()

	$('#submit-post-button').click -> 
    $('span').text('')
    $('.form-group').removeClass('has-error')

  $('#submit_post_button_form').click -> 
    $('span').text('')
    $('.form-group').removeClass('has-error')
