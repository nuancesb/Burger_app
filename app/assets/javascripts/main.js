var myMap = myMap || {};

myMap.initialize = function(){

  var mapOptions = {
    center: { lat: 51.52, lng: -0.115},
    zoom: 14, 
    styles: [{"stylers":[{"hue":"#dd0d0d"}]},{"featureType":"road","elementType":"labels","stylers":[{"visibility":"off"}]},{"featureType":"road","elementType":"geometry","stylers":[{"lightness":100},{"visibility":"simplified"}]}]
  };

  myMap.map = new google.maps.Map(myMap.mapElement, mapOptions);

  var markerOptions = {
    position: {lat: 51.53, lng: -0.115446}
  };

  var marker = new google.maps.Marker(markerOptions);
  marker.setMap(map);

  var popupOptions = {
    content: '<strong>We are here</strong>',

    //random position: 
    // position: new google.maps.LatLng(51.535, -0.10945)
  };

  var popup = new google.maps.InfoWindow(popupOptions);

  // setTimeout(function(){
  //   popup.open(myMap.map);
  // }, 5000);

  google.maps.event.addListener(marker, 'click', function(){
    popup.open(myMap.map, marker);
  });

  setTimeout(function(){
    myMap.map.setCenter(marker.getPosition());  
  }, 3000);

  myMap.locatorElement.on('click', function(){
    myMap.getPosition();
    //
  });

};

myMap.getPosition = function(){
  if (navigator.geolocation){
    var geolocation = navigator.geolocation.getCurrentPosition(myMap.geolocationSuccess, myMap.geolocationFail);
  } else{
    alert('you do not have geolocation enabled')
  };
};

myMap.geolocationSuccess = function(position){

  console.log(position.coords);
  var latitude = position.coords.latitude;
  var longitude = position.coords.longitude;


  var marker2Options = {
    position: {lat: latitude, lng: longitude},
    icon: 'http://cdn-img.easyicon.net/png/5464/546489.png'
  };

  var marker2 = new google.maps.Marker(marker2Options);
  marker2.setMap(myMap.map);
  myMap.map.setCenter(marker2.getPosition());
  myMap.map.setZoom(17);
 

  var popup2Options = {
    content: "we're really here",
  }

  var popup2 = new google.maps.InfoWindow(popup2Options);

  google.maps.event.addListener(marker2, 'click', function(){
    popup2.open(myMap.map, marker2);
  });

};

$(function(){
  myMap.mapElement = $('#map-canvas')[0];
  // myMap.locatorElement = $('#locator');
  myMap.initialize();


});

// google.maps.event.addListener(window, 'load', myMap.initialize)

// [
//       {
//         "stylers": [
//           { "lightness": 14 },
//           { "gamma": 0.59 },
//           { "saturation": -71 }
//         ]
//       }
//     ]