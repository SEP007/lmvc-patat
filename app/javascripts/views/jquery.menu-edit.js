Dropzone.autoDiscover = false;

$(function() {
    $(".dropzone").dropzone({
        url: $('#dropzone form').attr('action'),
        uploadMultiple: false,
        success: function(file, response) {
            var $element    = $(this.element);
            var filename    = response.filename;
            var $imgTag     = $element.find('img');
            var imgParts    = $imgTag.attr('src').split('/');

            $('#menu-form > #filename').val(response.filename);

            window.setTimeout(function() {
                $element.find('#no-img').remove();
                $element.find('.dz-image-preview').remove();
                $element.removeClass('dz-started');
            }, 1000);

            imgParts[imgParts.length -1] = filename;
            $imgTag.attr('src', imgParts.join("/"));
        }
    });
});