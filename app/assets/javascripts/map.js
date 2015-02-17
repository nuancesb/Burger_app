var myMap = myMap || {};



myMap.initialize = function() {

  var latitude = 51.5;
  var longitude= -0.05;

  var mapOptions = {
      center: { lat: latitude, lng: longitude},     
      zoom: 11,
      // mapTypeId:google.maps.MapTypeId.ROADMAP 
  };

  myMap.map = new google.maps.Map(myMap.mapCanvas, mapOptions);

    

};

myMap.addMarker = function(data){

  var markerOptions = {
    position: { 
      lat: data.lat, 
      lng: data.lng
    }
  };

  var marker = new google.maps.Marker(markerOptions);

  marker.setMap(myMap.map);

  var popupOptions = {
    content: data.popupContent
  };

  var popup = new google.maps.InfoWindow(popupOptions);
  
  google.maps.event.addListener(marker, "click", function(){
    popup.open(myMap.map, marker);
  });

  google.maps.event.addListener(marker, "mouseover", function(){
    popup.close(myMap.map, marker);
  });
  // popup.open(myMap.map, marker);

}

$(document).ready(function() {
  if ($('#map-canvas').length > 0) {
    myMap.mapCanvas = $('#map-canvas')[0];
    myMap.initialize();  
  }

  if($('.restaurant')) {

    // $('.restaurant').each(function(index, restaurant) {
    //   $restaurant = $(restaurant);

    //   name = $restaurant.data('name');
    //   var latitude = parseFloat($restaurant.data('latitude'));
    //   var longitude = parseFloat($restaurant.data('longitude'));

      // var markerOptions = {
      //   position: { lat: latitude, lng: longitude }
      // };

      // var marker = new google.maps.Marker(markerOptions);
      // marker.setMap(myMap.map);

      $.get(
        '/restaurants',
        {},
        function(data) {
          $.each(data, function(key, restaurant) {
            if (restaurant.latitude !== null && restaurant.longitude !== null) {

              myMap.addMarker({
                lat: restaurant.latitude,
                lng: restaurant.longitude,
                icon: 'http://maps.google.com/mapfiles/ms/icons/red-dot.png',

                popupContent: '<a href="/restaurants/' + restaurant.id + '">'+ restaurant.name + '</a><br>'
              });
            };       
          });
        },
          'json'
      );
  }

 });



