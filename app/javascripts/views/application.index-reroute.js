navigator.geolocation.watchPosition(function(location){
    window.location = window.location + "dishes/" + location.coords.longitude + "/" + location.coords.latitude;
});