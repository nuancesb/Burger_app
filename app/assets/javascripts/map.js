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

$(document).ready(function() {
  myMap.mapCanvas = $('#map-canvas')[0];
  myMap.initialize();

  if($('.restaurant')) {

    $('.restaurant').each(function(index, restaurant) {
      $restaurant = $(restaurant);

      name = $restaurant.data('name');
      var latitude = parseFloat($restaurant.data('latitude'));
      var longitude = parseFloat($restaurant.data('longitude'));

      var markerOptions = {
        position: { lat: latitude, lng: longitude }
      };

      var marker = new google.maps.Marker(markerOptions);
      marker.setMap(myMap.map);
    });



  }

 });



