# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('.new_user').hide()
  $('body').on 'click', '#add_user', ->
    $('.new_user').toggle()
    false
  $('.new_user').on 'ajax:success', ->
    console.log 'User created via AJAX'
  $('table').on 'ajax:success', '.destroy_user', ->
    $(this).closest('tr').remove()
    document.getElementById("notice").innerHTML = "User has been deleted"
    $('#notice').show
    notice_hiding()
    false
  $('p').click ->
    $(this).hide()
    false
  $('h4').click ->
    $('p').toggle(1000)
    false
  $('h4').hover (->
    console.log 'User deleted via AJAX'
    false
  ), ->
    console.log 'User created via AJAX'
    false
  $('p').on
    mouseenter: ->
      $(this).css 'background-color', 'lightgray'
      false
    mouseleave: ->
      $(this).css 'background-color', 'lightblue'
      false
    click: ->
      $(this).css 'background-color', 'yellow'
      false
  notice_hiding = () ->   
    setTimeout (->
      $('#notice').fadeOut 6000
      false
    ), 3000
    false
  notice_hiding()
