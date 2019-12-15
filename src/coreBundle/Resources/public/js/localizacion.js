$('document').ready(function(){
    var map;
    var markersArray = [];
    var marker;

    var lat = $("#form_latitud").val();
    var lon = $("#form_longitud").val();
    if (lat != 0 && lon != 0){
        localizacionEstablecimiento(lat, lon);
    }else{
        initialize();
    }

    function localizacionEstablecimiento(latitud, longitud){

        var mapOptions = {
            zoom: 8,
            mapTypeId: google.maps.MapTypeId.ROADMAP,
            center: new google.maps.LatLng(41.385131, 2.173315),
            scrollwheel: false
        };

        map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
        if (latitud != 0 && longitud != 0 ){
            deleteOverlays();
            var myLatlng = new google.maps.LatLng(latitud,longitud);
            marker = new google.maps.Marker({
                map:map,
                draggable:true,
                animation: google.maps.Animation.DROP,
                position: myLatlng
            });
            markersArray.push(marker);

            map.setZoom(17);
            map.setCenter(marker.getPosition());
            google.maps.event.addListener(marker, 'dragstart', function() {
            });
            google.maps.event.addListener(marker, 'drag', function() {

            });
            google.maps.event.addListener(marker, 'dragend', function() {
                actualizar(marker.getPosition());
            });
        }
    }

    function initialize() {
        var mapOptions = {
            zoom: 8,
            mapTypeId: google.maps.MapTypeId.ROADMAP,
            center: new google.maps.LatLng(41.385131, 2.173315),
            scrollwheel: false
        };

        map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
    }

    $('#buscarUbicacion').keyup(
        function(){
            geolocalizar();
        }
    );
//https://reviblog.net/2016/01/08/javascript-obtener-la-distancia-distancia-en-kilometros-entre-dos-puntos-dadas-por-su-latitud-y-longitud/
    function geolocalizar(){
        var dir = $('#buscarUbicacion').val();
        if (dir.length > 0){
            deleteOverlays();
            var geocoder = new google.maps.Geocoder();
            geocoder.geocode( { 'address': dir}, function(results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    var latitude = results[0].geometry.location.lat();
                    var longitude = results[0].geometry.location.lng();

                    marker = new google.maps.Marker({
                        map:map,
                        draggable:true,
                        animation: google.maps.Animation.DROP,
                        position: results[0].geometry.location
                    });
                    markersArray.push(marker);

                    $("#form_latitud").val(latitude);
                    $("#form_longitud").val(longitude);
                    map.setZoom(17);
                    map.setCenter(marker.getPosition());

                    google.maps.event.addListener(marker, 'click', toggleBounce);

                    google.maps.event.addListener(marker, 'dragstart', function() {
                    });
                    google.maps.event.addListener(marker, 'drag', function() {
                    });
                    google.maps.event.addListener(marker, 'dragend', function() {
                        actualizar(marker.getPosition());
                    });
                }
            })
        }
    }

    function actualizar(markerPosition){
        $("#form_latitud").val(markerPosition.lat());
        $("#form_longitud").val(markerPosition.lng());
    }

    // Deletes all markers in the array by removing references to them
    function deleteOverlays() {
        if (markersArray) {
            for (i in markersArray) {
                markersArray[i].setMap(null);
            }
            markersArray.length = 0;
        }
    }

    function toggleBounce() {
        if (marker.getAnimation() != null) {
            marker.setAnimation(null);

        } else {
            marker.setAnimation(google.maps.Animation.BOUNCE);
        }
    }

});