$(document).on('turbolinks:load', function () {
    $('#article-likes').on('ajax:success', function(event, data) {
        //console.log(data);
        var $link = $(event.currentTarget);
        if (data.success) {
            var str;
            var href;
            switch (data.action) {
                case 'like':
                    str = 'Unlike';
                    href = data.unlike_path;
                    break;
                case 'unlike':
                    str = 'Like';
                    href = data.like_path;
                    break;
            };

            str = str + ' (' + data.count + ')';
            $link.text(str);
            $link.attr('href', href)
        }
        return false;
    });
});