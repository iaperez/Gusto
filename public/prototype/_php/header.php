<?php
echo '<!doctype html>
<!--[if IE 9]><html class="lt-ie10" lang="en" > <![endif]-->
<html class="no-js" lang="en">
  <head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Gusto</title>
  <link href="http://fonts.googleapis.com/css?family=Crimson+Text:400,600,700,400italic,600italic,700italic|Oleo+Script+Swash+Caps" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="_css/normalize.css" />
  <link rel="stylesheet" href="_css/foundation.css" />
  <link rel="stylesheet" href="_css/foundation-overrides.css" />
  <link rel="stylesheet" href="_css/style.css" />
  <link rel="stylesheet" href="_css/font-awesome/css/font-awesome.min.css">
  <script type="text/javascript" src="https://apis.google.com/js/plusone.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
  <script src="_js/vendor/modernizr.js"></script>
  <script src="_js/vendor/jquery.js"></script>
  <script src="_js/vendor/jquery-ui-1.10.3.custom.min.js"></script>
  <script src="_js/foundation.min.js"></script>
  <script src="_js/script.js"></script>
  </head>
<body>

<div class="wrapper">

  <div class="contain-to-grid sticky">
    <nav class="top-bar" data-topbar>
      <ul class="title-area">
        <li class="name sitename">
          Gusto
        </li>
        <li class="toggle-topbar menu-icon"><a href="#">Menu</a></li>
        
      </ul>
      <section class="top-bar-section">
        <!-- Left Nav Section -->

        <!-- Right Nav Section -->
        <ul class="right">
          <li class="has-form">
            <div class="row collapse">
              <div class="small-3 columns">
                <label for="set-location" class="right inline">Location:</label>
              </div>              
              <div class="small-6 columns">
                <input id="set-location" type="text" placeholder="City, State or ZIP" value="Berkeley, CA">
              </div>
              <div class="small-3 columns">
                <a href="#" id="set-location-button" class="button expand">Set</a>
              </div>
            </div>          
          </li>          
          <li><a href="register.html">Create Account</a></li>
          <li><a href="">Sign In</a></li>     
        </ul>
      </section>
    </nav>
  </div>';
?>