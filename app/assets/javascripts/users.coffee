# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('.new_user').hide()
  $('body').on 'click', '#add_user', ->
    $('.new_user').slideDown()
    false
  $('.new_user').on 'ajax:success', ->
    console.log 'User created via AJAX'
  $('td').on 'ajax:success', '.destroy_user', ->
    $(this).closest('tr').remove()
    false
  $('.destroy_user').on 'ajax:success', ->
    console.log 'User deleted via AJAX'
    false
  $('p').click ->
    $(this).hide()
    false
