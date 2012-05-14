# apply ace to the #editor element
editor = ace.edit('editor')
textarea = $('#editor').prev('textarea')
HTMLMode = require("ace/mode/html").Mode
JavaScriptMode = require("ace/mode/javascript").Mode
CSSMode = require("ace/mode/css").Mode

editor.setTheme("ace/theme/twilight")
editor.getSession().setValue(textarea.val())

# before submiting the form, put the content of the #editor in the #content input 
textarea.closest('form').submit ->
  textarea.val(editor.getSession().getValue())
  return true

if $('#admin_component_component_type_id').val() == '1'
  editor.getSession().setMode(new HTMLMode())
else if $('#admin_component_component_type_id').val() == '2'
  editor.getSession().setMode(new HTMLMode())
else if $('#admin_component_component_type_id').val() == '4'
  editor.getSession().setMode(new JavaScriptMode())
else if $('#admin_component_component_type_id').val() == '3'
  editor.getSession().setMode(new CSSMode())


$('#editor-buttons').click ->

  e = $('#editor')
  e.css({
      visibility: 'hidden',
  })
  
  origin = e.offset()
  
  e.css( {position: 'absolute'} )
  
  e.offset({
      top: origin.top, 
      left: origin.left})
  
  e.css({
      visibility: 'visible',
  }).animate({
      top: '40px',
      left:0
  }, 300)