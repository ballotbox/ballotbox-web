# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
window.onload = () ->
  $('#add_choice_field').click (e) ->
    console.log('hello')
    choices = $('#choices')
    n = choices.find('input').length
    choices.append("<div><input id='election_choices_attributes_" + n + "_body' name='election[choices_attributes][" + n + "][body]' type='text'></div>")