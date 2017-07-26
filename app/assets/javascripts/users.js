$(document).on('turbolinks:load', function() {
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (event) {
                $('#user-avatar-preview').attr('src', event.target.result);
            };
            reader.readAsDataURL(input.files[0]);
        }
    }

    $("#user_avatar").change(function(){
        readURL(this);
    });
});


