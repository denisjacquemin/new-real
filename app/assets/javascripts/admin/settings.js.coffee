$(document).ready -> 
  # on the settings/fields screen
  # submit the form on change event of a category or fieldtype <select> field
  $('.change-category, .change-fieldtype').change -> $(this).find('.submit').click()
  
  # on the settings/fields screen
  # add empty form to create a new field
  $('.new-button-field').click ->
    $.ajax({
     url: '/admin/fields/new',
     success: (data) ->
         $('.new-button').attr('disabled', 'disabled') # disable the 'new' button
         $('h1').after(data)
         $('.new-field-label:first').focus()
    })
  
  # a click on the cancel button remove the new field form
  $('.cancel-new-field').live('click', ->
    $(this).closest('form').remove()
    $('.new-button').removeAttr('disabled') # enable the 'new' button
    false # don't submit the form
  )