;(function () {
    var onload = window.onload;
    window.onload = function () {
        if (window.jQuery) {
            $('#username').focus();
        }
        return onload();
    }
})();