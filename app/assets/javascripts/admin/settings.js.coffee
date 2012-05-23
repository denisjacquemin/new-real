# on the settings/fields screen
# submit the form on change event of a category <select> field
$(document).ready -> $('.change-category').change -> $(this).find('.submit').click()