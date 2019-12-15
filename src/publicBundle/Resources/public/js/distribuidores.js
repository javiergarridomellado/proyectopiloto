var map;
var markersArray = [];
var infoArray = [];
$('document').ready(function(){
    var marker;

    initialize();

    function initialize() {
        var mapOptions = {
            zoom: 8,
            mapTypeId: google.maps.MapTypeId.ROADMAP,
            center: new google.maps.LatLng(41.385131, 2.173315),
            scrollwheel: false
        };

        map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
    }

    $('#textCodigo').keyup(
        function(){
            geolocalizar();
        }
    );

    function geolocalizar(){
        var dir = $('#textCodigo').val();
        if (dir.length > 0){
            var geocoder = new google.maps.Geocoder();
            geocoder.geocode( { 'address': dir}, function(results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    map.setZoom(12);
                    map.setCenter(results[0].geometry.location);
                }
            });
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

function setLocalizacion(latitud, longitud, nombre, div){
    var myLatlng = new google.maps.LatLng(latitud,longitud);
      /*var contentString = '<div id="content">'+
      '<div id="siteNotice">'+
      '</div>'+
      '<a href= ' + url+ ' id="firstHeading">'+nombre+'</a>'+
      '<div id="descripcionMapa">'+
      '<p>'+descripcion+'</p>'+
      '</div>'+
      '</div>';*/
    var contentString = $(div).html();

     var marker = new google.maps.Marker({
        map:map,
        title: nombre,
        draggable:false,
        animation: google.maps.Animation.DROP,
        position: myLatlng
      });
    markersArray.push(marker);
    
    var infowindow = new google.maps.InfoWindow({
      content: contentString,
      maxWidth: 475
    });
    infoArray.push(infowindow);
      
    google.maps.event.addListener(marker, 'click', function() {
        CloseInfowindows();
        infowindow.open(marker.get('map'),marker);
    });
    
}

function CloseInfowindows() {
  for (var mkey in infoArray) {
    var mobj = infoArray[mkey];
    mobj.close();
  }
}