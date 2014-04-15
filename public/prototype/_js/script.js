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

  $(".rating-item-bar").each(function() {
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

  // This takes the rating from the data-rating tag and sets the color of the border

  $(".type-rating-item").each(function() {
    var rating = $(this).data("rating");
    var version = $(this).data("version");
    var bordercolor = "#d9d9d9";
    if (rating < 5) {
      // bordercolor = "#DE5F28"; // red
      bordercolor = "#C5D7E8"; // blue gray
    } else if (rating > 5 && rating < 7.5) {
      // bordercolor = "#E6CF4E"; // yellow
      bordercolor = "#83B9EB"; // muted blue
    } else if (rating > 7.5) {
      // bordercolor = "#469E50"; // green
      bordercolor = "#3693EB"; // bright blue
    }
    $(this).css({"border-color" : bordercolor});
    $(this).children(".type-rating-number").text(rating);
  });

  // Finder Bar Navigation Scripts
  // var extraBarCount = 0;
  // var finderBar = "<div class='finder-extra-bar'>and that \
  //             <select id='finder-store-extra-COUNT' class='finder-extra-select'> \
  //               <option value=''></option> \
  //               <option value=''>have a quiet ambience</option> \
  //               <option value=''>have plentiful parking</option> \
  //               <option value=''>have a very attentive staff</option> \
  //             </select> \
  //             <i class='fa fa-times fa-lg extra-bar-delete'></i> \
  //             </div>"; 


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

  // $(document).on("click", ".extra-bar-delete", function() {
  //   event.preventDefault();
  //   $(this).parent().remove();
  //   extraBarCount--;
  // });

  // $("#finder-more").click(function() {
  //   var thisFinderBar = finderBar.replace("COUNT", extraBarCount+1);
  //   $("#finder-extra-bars").append(thisFinderBar).show();
  //   extraBarCount++;
  // });

  // Add store to favorites
  $(document).on("click", ".add-to-bookmarks", function () {
    event.preventDefault();
    $(this).children("i.bookmark").addClass("fa-bookmark").removeClass("fa-bookmark-o");
    $(this).children("span.bookmark-message").text("Saved to Bookmarks");
    $(this).removeClass(".add-to-bookmarks");
  });

  // The one-question survey at the top of store profiles
  $("#store-survey-link").click(function() {
    event.preventDefault();
    $('#survey-bar').slideDown();
  });  

  $("#register-submit").click(function() {
    event.preventDefault();
    $("#registration-form").slideUp();
    $("#registration-form-2").slideDown();
  })

  // Store Profile Form

  $("#add-store-form-info-submit").click(function() {
    event.preventDefault();
    if ($("#new-store-name").val().length > 0) {
      $("#add-store-form-info").slideUp();
      $("#add-store-survey-1").slideDown();
      $("#success-status").slideUp();
    } else { 
      $('#store-error').show();
    }
  })

  $("#add-store-survey-1-submit").click(function() {
    event.preventDefault();
    $("#add-store-survey-1").slideUp();
    $("#add-store-survey-2").slideDown();
    $('html, body').animate({ scrollTop: 0 }, 'slow');
  })

  $("#add-store-survey-2-submit").click(function() {
    event.preventDefault();
    $("#add-store-survey-2").slideUp();
    $("#add-store-survey-3").slideDown();
    $('html, body').animate({ scrollTop: 0 }, 'slow');

  })

  $("#add-store-survey-3-submit").click(function() {
    event.preventDefault();
    $("#add-store-survey-3").slideUp();
    $("#add-store-survey-4").slideDown();
    $('html, body').animate({ scrollTop: 0 }, 'slow');

  })

  $("#add-store-survey-4-submit").click(function() {
    event.preventDefault();
    $("#add-store-survey-4").slideUp();
    $("#add-store-survey-5").slideDown();
    $('html, body').animate({ scrollTop: 0 }, 'slow');    
  })

  $("#final-form-submit").click(function() {
    event.preventDefault();
    $("#add-store-form").submit();
  })

  $(".attribute-details-icon").click(function() {
    event.preventDefault();
    if ($(this).hasClass("open")) {

      $(this).children("i").addClass("fa-plus-square-o").removeClass("fa-minus-square-o");
      $(this).removeClass("open").parent().siblings(".attribute-details").fadeOut();
      $(this).parents(".store-profile-attribute").animate({ height: 36}, 300, function() {});




    } else {

      $(this).children("i").addClass("fa-minus-square-o").removeClass("fa-plus-square-o");
      $(this).parents(".store-profile-attribute").animate({ height: 100}, 300, function() {});

      $(this).parent().siblings(".attribute-details").html("This will show the owner/expert/shopper breakdown of the rating");
      $(this).parent().siblings(".attribute-details").fadeIn();
      $(this).addClass("open");
    }

    
    
    
    
  })

  $(".toggle-extra-bars").click(function(){
    event.preventDefault();
    if ($(this).hasClass("open")) {
      $(this).removeClass("open").parent().siblings("#finder-extra-bars").slideUp();
    } else {
      $(this).addClass("open").parent().siblings("#finder-extra-bars").slideDown();
    }

  });

  $(".category-extra-show").click(function(){
    event.preventDefault();
    $(this).hide();
    $(this).parent().siblings(".category-extra").show();
  });

  $(".finder-extra-select").change(function() { 
    if ($(this).text() != "label") {
      var thisLabelText = $(this).find("option[value='label']").text();
      console.log(thisLabelText);
      $(this).parent().siblings(".category-name").text(thisLabelText);
    }
  }); 

  $("#finder-submit").click(function(){
    event.preventDefault();
    loadResults();
  });  

  function loadResults() {

    $("#finder-extra-bars").slideUp();
    $("#store-results").fadeOut().delay(300);
    $("#store-results").fadeIn();


    var queryStoreType = $("#finder-store-type").val(); // adventure/bargain...
    var queryStoreCategory = $("#finder-store-category").val(); // furniture/clothing...
    var queryStorePersonality = $("#finder-store-personality").val(); // welcoming/friendly...
    var queryString = "Stores selling ";

    if (queryStoreCategory != "") {
      queryString += queryStoreCategory;
    } else {
      queryString += "anything";
    }

    queryString += " that are ";

    if (queryStorePersonality != "") {
      queryString += queryStorePersonality;
    } else {
      queryString += "any personality";
    }

    queryString += " and good for ";

    if (queryStoreType != "") {
      queryString += queryStoreType;
    } else {
      queryString += "all types of shopping";
    }

    $(".store-result-query").hide().delay(800).text(queryString).show();
    
  };



  // Here's how to grey out and deactivate a select box
  // $("#finder-store-goods-1").attr('disabled','disabled').css({"background-color": "#e3e3e3", "opacity": 0.5});

});
