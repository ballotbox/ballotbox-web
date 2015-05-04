# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready () ->
  $('.add-choice-field').click (e) ->
    choices = $('#choices')
    n = choices.find('input').length
    choices.append("<div class='input-group'><span class='input-group-addon'></span><input id='election_choices_attributes_0_body' name='election[choices_attributes][0][body]' type='text' class='form-control choices' placeholder='...'><span class='input-group-btn'><button class='remove-choice-field btn btn-default' type='button'><section class='glyphicon glyphicon-remove'/></button></span></div>")
    ballotbox.renumber_rails_form('.choices')
  $('#choices').on 'click', '.remove-choice-field', (e) ->
    e.preventDefault()
    $(this).closest('.input-group').remove()
    ballotbox.renumber_rails_form('.choices')