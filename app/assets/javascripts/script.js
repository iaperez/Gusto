// Foundation CSS

$(function(){ $(document).foundation();});


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

(function() {
    $(document).on('click', 'form .remove_fields', function(event) {
        $(this).prev('input[type=hidden]').val('1');
        $(this).closest('.fields').hide();
        return event.preventDefault();
    });

   $(document).on('click', 'form .add_fields', function(event) {
        var regexp, time;
        time = new Date().getTime();
        regexp = new RegExp($(this).data('id'), 'g');
        $(this).before($(this).data('fields').replace(regexp, time));
        return event.preventDefault();
    });
}).call(this);

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

    $(".survey-image").hover(
        function() {
            $(this).addClass( "hover" );
        }, function() {
            $(this).removeClass( "hover" );
        }
    );

    $(".survey-image").click(function() {
        $(this).toggleClass("selected");
    });

    $(".store-profile-attribute-content .attribute-rating, .attribute-label").hover(
        function() {
            $(this).siblings('.attribute-description').show();
        }, function() {
            $(this).siblings('.attribute-description').hide();
        }
    );


    // This takes the rating from the data-rating tag and sets the color of the background

    $(".type-rating-item").each(function() {
        var rating = $(this).data("rating");
        var version = $(this).data("version");
        var lightness = 77 - rating*5 + "%"; // The first number here should be max score lightness + 50

        // hsla(107, 50%, 50%, 1) - green (max score)
        // hsla(0, 75%, 40%, 1) - pink/purple (max score)
        // hsla(180, 30%, 27%, 1) - teal
        // hsla(311, 37%, 37%, 1) - darker purple

        var backgroundColor = "hsla(180, 30%, "+lightness+", 1)";

        $(this).css({"background-color" : backgroundColor});
        $(this).children(".type-rating-number").text(rating);
    });

    // Add store to favorites
    $(document).on("click", ".add-to-bookmarks", function (event) {
        event.preventDefault();
        $(this).children("i.bookmark").addClass("fa-bookmark").removeClass("fa-bookmark-o");
        $(this).children("span.bookmark-message").text("Saved to Bookmarks");
        $(this).removeClass(".add-to-bookmarks");
    });

    // The one-question survey at the top of store profiles
    $("#store-survey-link").click(function(event) {
        event.preventDefault();
        $('#survey-bar').slideDown();
    });

    // User Registration Form
    $("#register-continue").click(function(event) {
        event.preventDefault();
        $("#registration-form").slideUp();
        $("#survey-1").slideDown();
    });


    $("#final-registration-form-submit").click(function(event) {
        window.location.replace("index.html");
    });


    // Store Profile Form
    $("#add-store-form-info-submit").click(function(event) {
        event.preventDefault();
        if ($("#new-store-name").val().length > 0) {
            $("#add-store-form-info").slideUp();
            $("#survey-1").slideDown();
            $("#success-status").slideUp();
        } else {
            $('#store-error').show();
        }
    });

    $("#final-store-form-submit").click(function(event) {
        event.preventDefault();
        $("#add-store-form").submit();
    });

    // Photo Survey
    $("#survey-1-submit").click(function(event) {
        event.preventDefault();
        $("#survey-1").slideUp();
        $("#survey-2").slideDown();
        $('html, body').animate({ scrollTop: 0 }, 'slow');
    });

    $("#survey-2-submit").click(function(event) {
        event.preventDefault();
        $("#survey-2").slideUp();
        $("#survey-3").slideDown();
        $('html, body').animate({ scrollTop: 0 }, 'slow');
    });

    $("#survey-3-submit").click(function(event) {
        event.preventDefault();
        $("#survey-3").slideUp();
        $("#survey-4").slideDown();
        $('html, body').animate({ scrollTop: 0 }, 'slow');
    });

    $("#survey-4-submit").click(function(event) {
        event.preventDefault();
        $("#survey-4").slideUp();
        $("#survey-5").slideDown();
        $('html, body').animate({ scrollTop: 0 }, 'slow');
    });


    $(".toggle-extra-options").click(function(event){
        event.preventDefault();
        if ($(this).hasClass("open")) {
            $(this).removeClass("open").parent().siblings("#finder-extra-options").slideUp();
            $('.option-selected').removeClass("option-selected");
            $('.option-inactive').removeClass("option-inactive");
            $(this).children('.note').text("(show options)");
        } else {
            $(this).addClass("open").parent().siblings("#finder-extra-options").slideDown();
            $(this).children('.note').text("(hide options)");

        }
    });

    $(".extra-options-hide-link").click(function(event){
        event.preventDefault();
        $("#finder-extra-options").slideUp();
        $('.option-selected').removeClass("option-selected");
        $('.option-inactive').removeClass("option-inactive");
    });

    $("#finder-submit").click(function(event){
        event.preventDefault();
        loadResults();
    });

    // highlight/unhighlight extra search filter options

    $('div.extra-option').on("click", function() {
        if ($(this).hasClass("option-selected")) {
            // deselect selected option
            $(this).removeClass("option-selected");
            $(this).siblings(".extra-option").removeClass("option-inactive");
            $(this).siblings("input[type=hidden]").val('');

            
        } else if ($(this).hasClass("option-inactive")) {
            // select a deselected option - grey out the other one
            $(this).removeClass("option-inactive").addClass("option-selected");
            $(this).siblings(".extra-option").removeClass("option-selected").addClass("option-inactive");
            $(this).siblings("input[type=hidden]").val(this.id);

        } else {
            $(this).addClass("option-selected");
            $(this).siblings(".extra-option").addClass("option-inactive");
            $(this).siblings("input[type=hidden]").val(this.id);
        }
    });


    // Here's how to grey out and deactivate a select box
    // $("#finder-store-goods-1").attr('disabled','disabled').css({"background-color": "#e3e3e3", "opacity": 0.5});

    $(".list-dropdown-option").click(function(event){
        event.preventDefault();
        tt=$(this).text()
        $(this).parent().parent().parent().find("input[type=hidden]").val($(this).attr('id'));
        $(this).parent().parent().parent().find(".header-dropdown").text($(this).text());
        $(this).parent().parent().parent().find(".header-dropdown").click();
    });

});