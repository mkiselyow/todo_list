# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', ->
  $('.new_user').hide()
  $('body').on 'click', '#add_user', ->
    $('.new_user').toggle(1000)
    $('#add_user').hide(1000)
    false
  $('.new_user').on 'ajax:success', ->
    document.getElementById("notice").innerHTML = "User created via AJAX"
    $('#notice').show()
    notice_hiding()
    false
  $('table').on 'ajax:success', '.destroy_user', ->
    $(this).closest('tr').remove()
    document.getElementById("notice").innerHTML = "User has been deleted"
    $('.new_user').hide()
    $('#notice').show()
    notice_hiding()
    false
  # $('.new_user').mouseleave ->
  #   $('#add_user').show(1000)
  #   $('.new_user').toggle(1000)
  #   false
  #projects
  $('.new_project').hide()
  $('body').on 'click', '#add_project', ->
    $('.new_project').toggle(1000)
    $('#add_project').hide(1000)
    $( "#project_name" ).focus()
    false
  $('.new_project').mouseleave ->
    $('#add_project').show(1000)
    $('.new_project').toggle(1000)
    false
  $('.new_project').on 'ajax:success', ->
    document.getElementById("notice").innerHTML = "Project created via AJAX"
    $('#notice').show()
    notice_hiding()
    false
  $('.jumbotron').on 'ajax:success', '.destroy_project', ->
    $(this).closest('ul.list-group').remove()
    document.getElementById("notice").innerHTML = "Project has been deleted"
    $('#notice').show()
    notice_hiding()
    false
  #notice_hiding
  notice_hiding = () ->   
    setTimeout (->
      $('#notice').fadeOut 2000
      false
    ), 2000
    false
  notice_hiding()
  #description hiding
  $('.super_functions').hide()
  $('#super_functions').hide()
  $('#description').on 'click', ->
    $('.super_functions').toggle(1000)
    $('#super_functions').toggle(1000)
    false
  #tasks
  $('.new_task').hide()
  $('.new_task').attr("draggable", "false")
  $('body').on 'click', '.add_task', ->
    $(this).closest('ul').find('.new_task').toggle(1000)
    false
  $('li.edit_task').hide()
  $('li.edit_task').attr("draggable", "false")
  $('body').on 'click', '.ed_task', ->
    $(this).closest('li').toggle(1000)
    $(this).closest('.task_each_div').find('li.edit_task').toggle(1000)
    false
  $('body').on 'click', '.back', ->
    $(this).closest('li').toggle(1000)
    $(this).closest('.task_each_div').find('li.list-group-item.item.task').toggle(1000)
    false
  # $('.new_project').mouseleave ->
  #   $('#add_project').show(1000)
  #   $('.new_project').toggle(1000)
  #   false
  $('.new_task').on 'ajax:success', ->
    document.getElementById("notice").innerHTML = "Task created via AJAX"
    $('#notice').show()
    notice_hiding()
    $('.new_task').hide(1000)
    false
  $('ul.list-group.sortable.list').on 'ajax:success', '.destroy_task', ->
    $(this).closest('li.list-group-item.item').remove()
    document.getElementById("notice").innerHTML = "Task has been deleted"
    $('#notice').show()
    notice_hiding()
    false
  #sessions ajax
  $('body').on 'click', '.destroy_session', ->
    $('li.edit_task').hide()
    $('.new_task').hide()
    $('.new_user').hide()
    false
  $('.destroy_session').on 'ajax:success', ->
    console.log 'Session deleted via AJAX'
    false
  #datetimepicker script
  $ ->
    $('.datetimepicker1').datetimepicker format: 'DD-MM-YYYY HH:MM'
    false
  #edit user
  $('body').on 'click', '.edit_user', ->
    # $(this).closest('tr').find('td').toggle(1000)
    $('.new_user').toggle(1000)
    # $('#add_user').hide(1000)
    false
  #popovers enable
  $ ->
    $('[data-toggle="popover"]').popover()
    false
  #practice
  # $('p').click ->
  #   $(this).hide()
  #   false
  # $('h4').click ->
  #   $('p').toggle(1000)
  #   false
  # $('h4').hover (->
  #   console.log 'User deleted via AJAX'
  #   false
  # ), ->
  #   console.log 'User created via AJAX'
  #   false
  # $('p').on
  #   mouseenter: ->
  #     $(this).css 'background-color', 'lightgray'
  #     false
  #   mouseleave: ->
  #     $(this).css 'background-color', 'lightblue'
  #     false
  #   click: ->
  #     $(this).css 'background-color', 'yellow'
  #     false