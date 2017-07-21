$(document).on('turbolinks:load', function() {
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (event) {
                $('#avatarPreview').attr('src', event.target.result);
            };
            reader.readAsDataURL(input.files[0]);
        }
    }

    $("#avatarInput").change(function(){
        readURL(this);
    });
});


