$(document).on('turbolinks:load', function () {
    $('#article-likes').on('ajax:success', function(event, data) {
        var $link = $(event.currentTarget);
        if (data.success) {
            var str;
            var href;

            switch (data.action) {
                case 'like':
                    str = '<span class="glyphicon glyphicon-thumbs-down"></span> Unlike';
                    href = data.unlike_path;
                    break;
                case 'unlike':
                    str = '<span class="glyphicon glyphicon-thumbs-up"></span> Like';
                    href = data.like_path;
                    break;
            }

            str = str + ' (' + data.count + ')';
            $link.html(str);
            $link.attr('href', href)
        }
        return false;
    });
});