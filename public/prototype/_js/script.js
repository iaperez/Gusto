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

  // User Registration Form
  $("#register-continue").click(function() {
    event.preventDefault();
    $("#registration-form").slideUp();
    $("#survey-1").slideDown();
  });


  $("#final-registration-form-submit").click(function() {
    window.location.replace("index.html");
  });


  // Store Profile Form
  $("#add-store-form-info-submit").click(function() {
    event.preventDefault();
    if ($("#new-store-name").val().length > 0) {
      $("#add-store-form-info").slideUp();
      $("#survey-1").slideDown();
      $("#success-status").slideUp();
    } else { 
      $('#store-error').show();
    }
  });

  $("#final-store-form-submit").click(function() {
    event.preventDefault();
    $("#add-store-form").submit();
  });

  // Photo Survey
  $("#survey-1-submit").click(function() {
    event.preventDefault();
    $("#survey-1").slideUp();
    $("#survey-2").slideDown();
    $('html, body').animate({ scrollTop: 0 }, 'slow');
  });

  $("#survey-2-submit").click(function() {
    event.preventDefault();
    $("#survey-2").slideUp();
    $("#survey-3").slideDown();
    $('html, body').animate({ scrollTop: 0 }, 'slow');
  });

  $("#survey-3-submit").click(function() {
    event.preventDefault();
    $("#survey-3").slideUp();
    $("#survey-4").slideDown();
    $('html, body').animate({ scrollTop: 0 }, 'slow');
  });

  $("#survey-4-submit").click(function() {
    event.preventDefault();
    $("#survey-4").slideUp();
    $("#survey-5").slideDown();
    $('html, body').animate({ scrollTop: 0 }, 'slow');    
  });


  // Store Attribute Details Stuff (Not Currently Used)

  // $(".attribute-details-icon").click(function() {
  //   event.preventDefault();
  //   if ($(this).hasClass("open")) {

  //     $(this).children("i").addClass("fa-plus-square-o").removeClass("fa-minus-square-o");
  //     $(this).removeClass("open").parent().siblings(".attribute-details").fadeOut();
  //     $(this).parents(".store-profile-attribute").animate({ height: 36}, 300, function() {});

  //   } else {

  //     $(this).children("i").addClass("fa-minus-square-o").removeClass("fa-plus-square-o");
  //     $(this).parents(".store-profile-attribute").animate({ height: 160}, 300, function() {});
  //     $(this).parent().siblings(".attribute-details").fadeIn();
  //     $(this).addClass("open");
  //   }
  // });

  // $('.user-rating-icon').on({
  //   mouseover: function(){
  //     var ratingValue = $(this).data("rating-value");
  //     var ratingLabel = $(this).data("rating-label");
  //     $(this).prevAll().andSelf().css("opacity", "1.0");
  //     $(this).parent().siblings('.attribute-details-user-description').text(ratingLabel);
  //   },
  //   mouseleave: function(){
  //     $(this).parent().siblings('.attribute-details-user-description').empty();
  //     $(this).prevAll().andSelf().css("opacity", ".25");
  //   },
  //   click: function(){
  //     var ratingValue = $(this).data("rating-value");
  //     var ratingLabel = $(this).data("rating-label");
  //     $(this).prevAll().andSelf().css("opacity", "1.0");
  //     $(this).siblings().andSelf().off('mouseover mouseleave click').addClass("set");
  //     $(this).parent().siblings('.attribute-details-user-description').text(ratingLabel + " - Rating Saved!");
  //   }
  // });

  $(".toggle-extra-options").click(function(){
    event.preventDefault();
    if ($(this).hasClass("open")) {
      $(this).removeClass("open").parent().siblings("#finder-extra-options").slideUp();
      $('.option-selected').removeClass("option-selected");
      $('.option-inactive').removeClass("option-inactive");
    } else {
      $(this).addClass("open").parent().siblings("#finder-extra-options").slideDown();
    }
  });

  $(".extra-options-hide-link").click(function(){
    event.preventDefault();
    $("#finder-extra-options").slideUp();
    $('.option-selected').removeClass("option-selected");
    $('.option-inactive').removeClass("option-inactive");
  });

  $("#finder-submit").click(function(){
    event.preventDefault();
    loadResults();
  });  

  // highlight/unhighlight extra search filter options

  $('div.extra-option').on("click", function() {
    if ($(this).hasClass("option-selected")) {
      // deselect
      $(this).removeClass("option-selected");
      $(this).siblings(".extra-option").removeClass("option-inactive");
    } else if ($(this).hasClass("option-inactive")) {
      // do nothing
    } else {
      $(this).addClass("option-selected");
      $(this).siblings(".extra-option").addClass("option-inactive");
    }
  });

  function loadResults() {

    $("#finder-extra-bars").slideUp();
    $("#store-results").fadeOut().delay(300);
    $("#store-results").fadeIn();

    var queryStoreType = $("#finder-store-type").val(); // adventure/bargain...
    var queryStoreCategory = $("#finder-store-category").val(); // furniture/clothing...

    var extraAttributes = "";

    var attrCount = 0;
    $(".extra-option.option-selected").each(function() {
      if (attrCount) {
        extraAttributes += ", ";
      }
      extraAttributes += $(this).text().toLowerCase();
      attrCount++;
    });


    var queryString = "Stores selling ";

    if (queryStoreCategory != "") {
      queryString += queryStoreCategory;
    } else {
      queryString += "anything";
    }

    queryString += " that are good for ";

    if (queryStoreType != "") {
      queryString += queryStoreType;
    } else {
      queryString += "all types of shopping";
    }

    if (extraAttributes.length > 0){
      queryString += " <em>and</em> are "+extraAttributes;
    }

    $(".store-result-query").hide().delay(800).html(queryString).show();
    
  };

  // $('.rating-tooltip').click(function() {
  //   var position = $('.tooltip-icon').offset();
  //   console.log("left "+position.left);
  //   console.log("top "+position.top);
  //   $("#rating-tooltip-box").css({"left" : position.left, "bottom" : position.bottom}).toggle();
  // });


  // Unused stuff from the old drop-down extra form
  // $(".category-extra-show").click(function(){
  //   event.preventDefault();
  //   $(this).hide();
  //   $(this).parent().siblings(".category-extra").show();
  // });

  // $(".finder-extra-select").change(function() { 
  //   if ($(this).text() != "label") {
  //     var thisLabelText = $(this).find("option[value='label']").text();
  //     $(this).parent().siblings(".category-name").text(thisLabelText);
  //   }
  // }); 

  // Here's how to grey out and deactivate a select box
  // $("#finder-store-goods-1").attr('disabled','disabled').css({"background-color": "#e3e3e3", "opacity": 0.5});

});
