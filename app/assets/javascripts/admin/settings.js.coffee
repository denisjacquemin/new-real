$(document).ready -> 
  
  ##########
  # Fields #
  ##########
  
  # on the settings/fields screen
  # add empty form to create a new field
  $('.new-button-field')
    .bind('ajax:beforeSend', (evt, xhr, settings) ->
      $(this).attr('disabled', 'disabled')
    )
    .bind('ajax:success', (evt, data, status, xhr) ->
      $('#new-form-container').html(xhr.responseText).slideDown('fast')
    )
    
  # on the settings/fields screen
  # when a new field is created, remove the form, 
  # enable .new-button-field and refresh list of fields
  $('#new_admin_field')
    .live('ajax:success', (evt, data, status, xhr) ->
      $('#new-form-container').slideUp('fast').empty()
      $('.new-button-field').removeAttr('disabled')
      $('#fields').html(xhr.responseText)
    )
    .live('ajax:error', (evt, xhr, status, error) ->
      msgbox = $('#messages')
      msgbox.append('<header><h1>Cannot save the field</h1></header>')
      msgbox.show()
    )
    
  # on the settings/fields screen
  # remove new field form and enable .new-button-field 
  $('.cancel-new-field').live('click', (event) -> 
    $('#new-form-container').slideUp('fast')
    $('.new-button-field').removeAttr('disabled')
    event.preventDefault()
  )
  
  # on the settings/fields screen
  # update the field when choosing a new category
  $('.change-category #admin_field_category_id, .change-fieldtype #admin_field_field_type_id').live('change', ->
    $(this).closest('form').submit()
  )

  ##############
  # Categories #
  ##############
  
  # on the settings/categories screen
  # add empty form to create a new category
  $('.new-button-category')
    .bind('ajax:beforeSend', (evt, xhr, settings) ->
      $(this).attr('disabled', 'disabled')
    )
    .bind('ajax:success', (evt, data, status, xhr) ->
      $('#new-form-container').html(xhr.responseText).slideDown('fast')
    )
  
  # on the settings/categories screen
  # when a new category is created, remove the form, 
  # enable .new-button-category and refresh list of categories
  $('#new_admin_category').live('ajax:success', (evt, data, status, xhr) ->
    $('#new-form-container').slideUp('fast').empty()
    $('.new-button-category').removeAttr('disabled')
    $('#categories').html(xhr.responseText)
  )
  
  # on the settings/categories screen
  # remove new category form and enable .new-button-category 
  $('.cancel-new-category').live('click', (event) -> 
    $('#new-form-container').slideUp('fast')
    $('.new-button-category').removeAttr('disabled')
    event.preventDefault()
  )

  #################
  # delete button #
  #################
  
  # after removing element from db, remove it from dom
  $('.delete-button').live('ajax:success', (evt, data, status, xhr) ->
    $(this).closest('tr').remove()
  )