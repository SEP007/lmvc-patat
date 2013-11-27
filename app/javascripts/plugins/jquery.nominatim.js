;(function ( $, window, document, undefined ) {
    var pluginName = "nominatim",
        defaults = {
            nominatimUrlInto: "http://nominatim.openstreetmap.org/",
            nominatimUrlOutro: "&format=json&polygon=0&addressdetails=0",
            dishesAction: "dishes/",
            searchBtn: "#search-long-lat",
            findPatatBtn: "#findpatat",
            errorBarNotLocated: "#js-user-not-located",
            errorBarNoLocation: "#js-no-location",
            resultElems: {
                latitude: "#latitude",
                longitude: "#longitude"
            },
            inputElems: {
                country: "#country",
                city: "#city",
                zip: '#zip',
                place: '#place'
            }
        };

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
            this.bindEventHandlers();
            this.findLocation();
        },
        cacheElems: function() {
            this.cachedElems = {
                country: this.$element.find(this.settings.inputElems.country),
                zip: this.$element.find(this.settings.inputElems.zip),
                city: this.$element.find(this.settings.inputElems.city),
                place: this.$element.find(this.settings.inputElems.place),

                latitude: this.$element.find(this.settings.resultElems.latitude),
                longitude: this.$element.find(this.settings.resultElems.longitude),

                searchBtn: this.$element.find(this.settings.searchBtn),
                findPatatBtn: this.$element.find(this.settings.findPatatBtn),

                errorBarNotLocated: this.$element.find(this.settings.errorBarNotLocated),
                errorBarNoLocation: this.$element.find(this.settings.errorBarNoLocation)
            };
        },
        validateInputs: function() {
            if (
                this.cachedElems.country.val() == 0 &&
                this.cachedElems.zip.val() == 0 &&
                this.cachedElems.city.val() == 0 &&
                this.cachedElems.place.val() == 0
            ) { return false; }

            return true;
        },
        findLocation: function() {
            var that = this;

            navigator.geolocation.getCurrentPosition( function(location) {
                that.location = {
                    latitude: location.coords.latitude,
                    longitude: location.coords.longitude
                };

                that.setLocation();
                that.requestAddress();
            });
        },
        setLocation: function() {
            this.cachedElems.latitude.val(
                this.location.latitude
            );
            this.cachedElems.longitude.val(
                this.location.longitude
            );
        },
        bindEventHandlers: function() {
            var that = this;

            // whenever the search button is clicked
            this.cachedElems.searchBtn.on('click', function(e) {
                e.preventDefault();

                that.requestLongLat();
            });

            // whenever the enter key is pressed
            this.$element.on('keypress', function(e) {

                var code = e.keyCode || e.which;

                // 13 is enter key's code
                if(code === 13) {
                    e.preventDefault();

                    if (that.validateInputs() === true) {
                        that.requestLongLat();
                    } else {
                        that.cachedElems.errorBarNoLocation.removeClass('hidden');
                        that.cachedElems.errorBarNotLocated.addClass('hidden');
                    }
                }
            });
        },
        parseLongLatUrl: function (params) {
            return this.settings.nominatimUrlInto + "search/?q=" + params.country + "," + params.zip + " " + params.city + "," + params.place + this.settings.nominatimUrlOutro;
        },
        parseAddressUrl: function () {
            return this.settings.nominatimUrlInto + "/reverse";
        },
        getParams: function () {
            return {
                country: this.cachedElems.country.val(),
                zip: this.cachedElems.zip.val(),
                city: this.cachedElems.city.val(),
                place: this.cachedElems.place.val()
            };
        },
        processLongLat: function () {
            // user located if found by long and lat
            var isUserLocated = this.cachedElems.longitude.val().length > 0 &&
                                this.cachedElems.latitude.val().length > 0

            // if he is redirect, otherwise show error
            if (isUserLocated === false) {
                this.cachedElems.errorBarNoLocation.addClass('hidden');
                this.cachedElems.errorBarNotLocated.removeClass('hidden');
            } else {
                this.cachedElems.findPatatBtn.removeAttr("disabled");

                window.location = this.settings.dishesAction + this.cachedElems.longitude.val()
                                  + "/" + this.cachedElems.latitude.val();
            }
        },
        requestAddress: function() {
            var that = this;
            $.ajax({
                url: this.parseAddressUrl(),
                context: document.body,
                data: {
                    format: 'json',
                    addressdetails: 1,
                    zoom: 18,
                    lat: that.location.latitude,
                    lon: that.location.longitude
                }
            }).done(function( data ) {
                var road        = (data.address.road || data.address.footway) || "";
                var housenumber = data.address.house_number || "";

                that.cachedElems.city.val(data.address.county || "");
                that.cachedElems.zip.val(data.address.postcode || "");
                that.cachedElems.place.val(
                    road + " " + housenumber
                );
            });
        },
        requestLongLat: function() {
            var that = this;

            $.ajax({
                url: this.parseLongLatUrl( this.getParams() ),
                context: document.body
            }).done(function( data ) {
                if(!data[0]) {
                    data = [{
                        lat: "",
                        long: ""
                    }];
                }

                that.cachedElems.latitude.val( data[0].lat || "" );
                that.cachedElems.longitude.val( data[0].lon || "" );

                that.processLongLat();
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