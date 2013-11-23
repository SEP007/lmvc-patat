;(function ( $, window, document, undefined ) {
    var pluginName = "handle",
        defaults = {
            endpointUrl: location.origin + "/" + window.lmvcConfig.appDir + "/registration/",
            handleEl: 'input#handle',
            triggerEl: 'input#restaurant',
            responseIndicatorEl: '#handle-response-indicator .add-on'
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

            this.cachedElems.$triggerEl.on('blur', function(e) {
                e.preventDefault();
                that.suggestHandle();
            });

            this.cachedElems.$handleEl.on('keyup', function(e) {
                e.preventDefault();
                that.validateHandle();
            });
        },
        cacheElems: function() {
            this.cachedElems = {
                $handleEl: this.$element.find(this.settings.handleEl),
                $triggerEl: this.$element.find(this.settings.triggerEl),
                $responseIndicatorEl: this.$element.find(this.settings.responseIndicatorEl)
            };
        },
        suggestHandle: function() {
            var that = this;

            $.ajax({
                url: that.settings.endpointUrl + 'suggestHandle/' + that.cachedElems.$triggerEl.val(),
                context: document.body,
                data: { }
            }).done(function(response) {
                that.cachedElems.$handleEl.val(response.handle);
            });
        },
        validateHandle: function() {
            var that = this;

            $.ajax({
                url: that.settings.endpointUrl + 'validateHandle/' + that.cachedElems.$handleEl.val(),
                context: document.body,
                data: { }
            }).done(function(response) {
                that.cachedElems.$responseIndicatorEl.html(response.isUsed === true ? "✗" : "✔");
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