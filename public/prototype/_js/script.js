// Foundation CSS

$(function(){ $(document).foundation(); });

// Google maps code

var map;
function mapsInitialize(lat, long, targetID) {
    var myLatlng = new google.maps.LatLng(lat, long);
    
    var mapOptions = {
        zoom: 14,
        center: myLatlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP   
    };
    map = new google.maps.Map(document.getElementById(targetID), mapOptions);
    
    var marker = new google.maps.Marker({
        position: myLatlng,
        map: map,
    });
}

$(document).ready(function() {

  /////////// Geolocation stuff ///////////
  
  if (navigator.geolocation) {
      var options = {
        enableHighAccuracy: true,
        timeout: 5000,
        maximumAge: 0
      };


      function success(pos) {
        var crd = pos.coords;
        console.log('Your current position is:');
        console.log('Latitude : ' + crd.latitude);
        console.log('Longitude: ' + crd.longitude);
        console.log('More or less ' + crd.accuracy + ' meters.');

        var mylat = crd.latitude;
        var mylong = crd.longitude;
        mylatlong = [mylat, mylong];

        google.maps.event.addDomListener(window, 'load', mapsInitialize(mylatlong[0], mylatlong[1], "store-profile-map"));    
      
      };

      function error(err) {
        console.warn('ERROR(' + err.code + '): ' + err.message);
      };       

      // navigator.geolocation.getCurrentPosition(success,error,options);       
  }  

  // This takes the rating from the data-rating tag and sets the color and width of the bar

  $(".meter-item-bar").each(function() {
    var rating = $(this).data("rating");
    var version = $(this).data("version");
    var barwidth = rating*10;
    if (version == "result") {
      barwidth = barwidth/1.5;
    } else if (version == "profile") {
      barwidth = barwidth/1.5;
    }
    barwidth = barwidth + "%";
    var barcolor = "#000";
    if (rating < 5) {
      barcolor = "#DE5F28"; // red
    } else if (rating > 5 && rating < 7.5) {
      barcolor = "#E6CF4E"; // yellow
    } else if (rating > 7.5) {
      barcolor = "#469E50"; // green
    }
    $(this).css({"background-color" : barcolor, "width" : barwidth});
    $(this).text(rating);

  });

  // Finder Bar Navigation Scripts

  var extraBarCount = 0;
  var finderBar = "<div class='finder-extra-bar'>and that \
              <select id='finder-store-extra-COUNT' class='finder-extra-select'> \
                <option value=''></option> \
                <option value=''>have a quiet ambience</option> \
                <option value=''>have plentiful parking</option> \
                <option value=''>have a very attentive staff</option> \
              </select> \
              <i class='fa fa-times fa-lg extra-bar-delete'></i> \
              </div>"; 


  // These add the extra select bar when use makes selection from the main bars

  // $("#finder-store-type, #finder-store-quality").change(function() {

  //   if (extraBarCount == 0) {
  //     var thisFinderBar = finderBar.replace("COUNT", extraBarCount+1);
  //     $("#finder-extra-bars").append(thisFinderBar).show();
  //   }
  //   extraBarCount++;

  // }); 

  // $(document).on("change", ".finder-extra-select", function() {

  //   var thisFinderBar = finderBar.replace("COUNT", extraBarCount+1);
  //   $("#finder-extra-bars").append(thisFinderBar);
  //   extraBarCount++;
  // });

  $(document).on("click", ".extra-bar-delete", function() {
    event.preventDefault();
    $(this).parent().remove();
    extraBarCount--;
  });

  $("#finder-more").click(function() {
    var thisFinderBar = finderBar.replace("COUNT", extraBarCount+1);
    $("#finder-extra-bars").append(thisFinderBar).show();
    extraBarCount++;
  });

  $("#set-location-button").click(function() {
    event.preventDefault();
    $("#current-location").text($("#set-location").val());
  });

  // $(document).on("click", ".show-full-profile", function() {
  //   event.preventDefault();
  //   $(this).text("Hide Full Profile").toggleClass("show-full-profile hide-full-profile");
  //   // $(this).parents('div.store-result').animate({"height": "700px"}, 400);
  //   $(this).parent().siblings('div.store-result-full-profile').show();
  // });

  // $(document).on("click", ".hide-full-profile", function() {
  //   event.preventDefault();
  //   $(this).text("Show Full Profile").toggleClass("show-full-profile hide-full-profile");
  //   $(this).parent().siblings('div.store-result-full-profile').hide();
  //   // $(this).parents('div.store-result').animate({"height": "auto"}, 400);

  // });

  // Add store to favorites

  $(document).on("click", ".add-to-bookmarks", function () {
    event.preventDefault();
    $(this).children("i.bookmark").addClass("fa-bookmark").removeClass("fa-bookmark-o");
    $(this).children("span.bookmark-message").text("Saved to Bookmarks");
    $(this).removeClass(".add-to-bookmarks");
  });

  $("#store-survey-link").click(function() {
    event.preventDefault();
    $('#survey-bar').slideDown();
  });  

  $("#finder-submit").click(function() {
    event.preventDefault();
  })

  $("#register-submit").click(function() {
    event.preventDefault();
    $("#registration-form").slideUp();
    $("#registration-form-2").slideDown();

  })

  $(".reg-image").click(function() {
    // event.preventDefault();
  })

});
