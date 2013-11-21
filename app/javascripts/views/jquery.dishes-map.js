var mode_toggle = function(mode){
    if(mode=="mode_d")
    {
        $('#btn_walk').removeAttr('disabled');
        window.travelMode='driving';
        $('#btn_drive').attr('disabled','disabled');
    }
    else if(mode=="mode_w")
    {
        $('#btn_drive').removeAttr('disabled');
        window.travelMode='walking';
        $('#btn_walk').attr('disabled','disabled');
    }
    $('#map').patatmap('requestLocation');
};

$('#map').patatmap({

});
$('#btn_walk').on('click', function(e){
    e.preventDefault();
    mode_toggle('mode_w');
});
$('#btn_drive').on('click', function(e){
    e.preventDefault();
    mode_toggle('mode_d');
});
