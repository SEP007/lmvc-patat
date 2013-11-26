/**
 * Uses Goggle Maps API to calculate journey duration
 * https://google-developers.appspot.com/maps/documentation/javascript/distancematrix?hl=en
 */
function calc_time(long1, long2, lat1, lat2)
{
    var destination = new google.maps.LatLng(lat1, long1);
    var origin      = new google.maps.LatLng(lat2, long2);

    var service = new google.maps.DistanceMatrixService();
    service.getDistanceMatrix(
        {
            origins: [origin],
            destinations: [destination],
            travelMode: google.maps.TravelMode.WALKING,
            unitSystem: google.maps.UnitSystem.METRIC,
            avoidHighways: false,
            avoidTolls: false
        }, callback);

}

function callback(response, status) {
    var timeLeftElem = document.getElementById("time-left");

    if (status != google.maps.DistanceMatrixStatus.OK) {
        timeLeftElem.innerHTML = 'Error was: ' + status;
    } else {

        var origins = response.originAddresses;

        for (var i = 0; i < origins.length; i++) {
            var results = response.rows[i].elements;
            for (var j = 0; j < results.length; j++) {
                var element = results[j];
                var duration = element.duration.text;
            }
        }
        timeLeftElem.innerHTML =duration.toString();
    }
}

$(function() {
    // request geo-location
    navigator.geolocation.watchPosition(function(location) {
        var $timeLeft = $('#time-left');
        calc_time(
            $timeLeft.data('longitude'),
            location.coords.longitude,
            $timeLeft.data('latitude'),
            location.coords.latitude
        );
    });
});

