var ready;

ready = function() {
    return $('.ckeditor').each(function() {
        return CKEDITOR.replace($(this).attr('id'));
    });
};

$(document).ready(ready);
$(document).on('turbolinks:load', ready);