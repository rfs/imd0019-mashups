$(document).ready(function() {
  window.handler = Gmaps.build('Google', {markers: {clusterer: {gridSize: 30, maxZoom: 15}}});
  window.handler.buildMap({
    provider: {
      zoom: 18,
      draggableCursor: 'default'
    },
    internal: {
      id: 'map'
    }
  }, function() {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition($.displayUserGeolocationOnMap);
    }
    window.geocoder = new google.maps.Geocoder();
    google.maps.event.addListener(window.handler.getMap(), 'click', function(event) {
      $.modalForm(event.latLng);
    });
    google.maps.event.addListenerOnce(window.handler.getMap(), 'idle', function() {
      $.displayManyOnMap(window.markers);
    });
  });

  $.displayUserGeolocationOnMap = function(position) {
    var marker = $.displayOnMap(position);
    window.handler.map.centerOn(marker);
  }

  $.displayOnMap = function(position) {
    var marker = window.handler.addMarker({
      lat: position.coords.latitude,
      lng: position.coords.longitude
    });
    return marker;
  }

  $.displayManyOnMap = function(positions) {
    window.handler.addMarkers(positions);
  }

  $.modalForm = function(latLng) {


    geocoder.geocode({'latLng': latLng}, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        if (results[1]) {
          // map.setZoom(11);
          // marker = new google.maps.Marker({
              // position: latlng,
              // map: map
          // });

          $.insvar = results[1];//.formatted_address;

          // infowindow.setContent(results[1].formatted_address);
          // infowindow.open(map, marker);
        }
      } else {
        alert("Geocoder failed due to: " + status);
      }
    });

    $('#newProblemModal').modal();
    $('#newProblemModal').on('shown.bs.modal', function(event) {
      $('#newProblemModal #problem_type_id').focus();
      $('#newProblemModal #latitude').val(latLng.lat());
      $('#newProblemModal #longitude').val(latLng.lng());
    });
  }

  $(document).on('click', 'input[name=autoset_problem_date]', function() {
    var problem_date = moment().subtract($(this).data('days'), 'days').format('DD/MM/YYYY');
    $('#newProblemModal #problem_date').val(problem_date);
  });
});
