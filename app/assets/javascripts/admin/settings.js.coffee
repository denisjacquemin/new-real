# on the settings/fields screen
# submit the form on change event of a category or fieldtype <select> field
$(document).ready -> $('.change-category, .change-fieldtype').change -> $(this).find('.submit').click()