;(function ( $, window, document, undefined ) {
    var pluginName = "favorite",
        defaults = {
            endpointUrl: location.origin + "/" + window.lmvcConfig.appDir + "/favorites/",
            triggerEl: 'a.favorite-btn'
        },
        cachedElemes= {};

    function Plugin ( element, options ) {
        this.element = element;
        this.$element = $(element);
        this.settings = $.extend( {}, defaults, options );
        this._defaults = defaults;
        this._name = pluginName;

        this.init();
    }

    Plugin.prototype = {
        init: function () {
            var that = this;

            this.cacheElems();

            this.cachedElems.$triggerEl.on('click', function(e) {
                e.preventDefault();

                var $clickedStar = $(this);
                that.favoriteDish($clickedStar);
            });
        },
        cacheElems: function() {
            this.cachedElems = {
                $triggerEl: this.$element.find(this.settings.triggerEl)
            };
        },
        favoriteDish: function($clickedStar) {
            var that = this;

            $.ajax({
                url: that.settings.endpointUrl + 'favorite-dish/' + $clickedStar.data("dishid"),
                context: document.body,
                data: { }
            }).done(function(response) {
                var $img = $clickedStar.children("img");
                var src = $img.attr("src");

                $img.attr("src", $img.data("otherwise"));
                $img.data("otherwise", src);
            });
        }
    };

    $.fn[ pluginName ] = function ( options ) {
        return this.each(function() {
            if ( !$.data( this, "plugin_" + pluginName ) ) {
                $.data( this, "plugin_" + pluginName, new Plugin( this, options ) );
            }
        });
    };

})( jQuery, window, document );

$(function() {
    $('body').favorite({

    });
});