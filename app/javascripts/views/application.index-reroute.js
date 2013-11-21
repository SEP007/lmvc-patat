navigator.geolocation.watchPosition(function(location){
    window.location = window.location + "dishes/" + location.coords.latitude + "/" + location.coords.longitude;
});