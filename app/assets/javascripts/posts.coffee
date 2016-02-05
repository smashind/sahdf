# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "page:change", ->

  $('#submit_post_button_form').click -> 
    $('span').text('')
    $('.form-group').removeClass('has-error')

$(document).ready ->
  $('.sad-vote').click ->
    postId = $(this).attr('class').match(/\d+/)