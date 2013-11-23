;(function ( $, window, document, undefined ) {
    var pluginName = "patatmap",
        defaults = {
            endpointUrl: location.origin + "/" + window.lmvcConfig.appDir + "/dishes/location/",
            draw: 'map'
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
            this.cacheElems();
            this.requestLocation();
        },
        cacheElems: function() {
            this.cachedElems = {
                map: undefined
            }
        },
        drawMap: function(destination) {
            var that = this;
            travelMode = window.travelMode || "walking";

            this.cachedElems.map = new GMaps({
                div: that.$element.attr('id'),
                lat: destination.latitude,
                lng: destination.longitude
            });

            GMaps.geolocate({
                success: function(position){
                    that.cachedElems.map.drawRoute({
                        origin: [position.coords.latitude, position.coords.longitude],
                        destination: [destination.latitude, destination.longitude],
                        travelMode: travelMode,
                        strokeColor: '#ED3B2F',
                        strokeOpacity: 0.8,
                        strokeWeight: 8
                    });
                    that.cachedElems.map.addMarkers([{
                        lat: position.coords.latitude,
                        lng: position.coords.longitude,
                        title: 'From',
                        infoWindow: {
                            content: '<h4>Hier bist du.</h4><p>Im Umkreis von </p>' + position.coords.accuracy + 'm' + '.'
                        }},{
                        lat: destination.latitude,
                        lng: destination.longitude,
                        title: 'To',
                        infoWindow: {
                            content: '<h4>' + destination.restaurant + '</h4><p>' + destination.street + '</p>'
                        }}
                    ]);
                }
            });
        },
        drawPanorama: function(destination) {
            var that = this;

            this.cachedElems.map = GMaps.createPanorama({
                el: '#'+that.$element.attr('id'),
                lat: destination.latitude,
                lng: destination.longitude
            });
        },
        requestLocation: function() {
            var that = this;

            $.ajax({
                url: that.settings.endpointUrl + that.$element.data('userid'),
                context: document.body,
                data: {
                    format: 'json'
                }
            }).done(function(destination) {
                if (that.settings.draw == 'map') { that.drawMap(destination); }
                else if(that.settings.draw == 'panorama') {that.drawPanorama(destination);}
            });
        }
    };

    /*
     * Plugin wrapper, preventing against multiple instantiations and
     * allowing any public function to be called via the jQuery plugin,
     * e.g. $(element).pluginName('functionName', arg1, arg2, ...)
     */
    $.fn[ pluginName ] = function ( arg ) {

        var args, instance;

        // only allow the plugin to be instantiated once
        if (!( this.data( "plugin_" + pluginName ) instanceof Plugin )) {

            // if no instance, create one
            this.data( "plugin_" + pluginName, new Plugin( this ) );
        }

        instance = this.data( "plugin_" + pluginName );

        instance.element = this;

        // Is the first parameter an object (arg), or was omitted,
        // call Plugin.init( arg )
        if (typeof arg === 'undefined' || typeof arg === 'object') {

            if ( typeof instance['init'] === 'function' ) {
                instance.init( arg );
            }

            // checks that the requested public method exists
        } else if ( typeof arg === 'string' && typeof instance[arg] === 'function' ) {

            // copy arguments & remove function name
            args = Array.prototype.slice.call( arguments, 1 );

            // call the method
            return instance[arg].apply( instance, args );

        } else {

            $.error('Method ' + arg + ' does not exist on jQuery.' + pluginName);

        }
    };

})( jQuery, window, document );