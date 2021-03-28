<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Restaurant Recommender</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Playfair+Display:ital,wght@0,400;0,500;0,600;0,700;1,400;1,500;1,600;1,700|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Restaurantly - v3.1.0
  * Template URL: https://bootstrapmade.com/restaurantly-restaurant-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
<script>
	$(document).ready(function(){
		
		/*try {
			navigator.geolocation.getCurrentPosition(showPosition);
			alert("here");
		}
		catch(err) {
			alert("error");
		}*/
		
		//for yelp
		$("#search").click(function(){
			var location = document.getElementById("location").value;
			var send = {location:location};
			$.get("YelpServlet", send, function(data, status){
				//alert("Data: " + data + "\nStatus: " + status);
				if(data === "invalidResult"){
					//var div = document.getElementById('name');
					//div.innerHTML = 'Invalid Search';
					$("#contentLeft").empty();
					$("#extra").empty();
					$("#name").empty();
					$("#infoButtons").empty();
					$("#name").append("<p>Invalid Location</p>");
					$("#extra").append("<p>Please Try A Different Location</p>");
					return;
				}
				var arr = data.split("outputDivider");
				var name = arr[0].replace("?","\'");
				var photos = arr[1].split("imageDivider");
				var price = arr[2].replace("?","\'");
				var rating = arr[3].replace("?","\'");
				var phone = arr[4].replace("?","\'");
				var address = arr[5].replace("?","\'");
				var title = arr[6].replace("?","\'");
				var url = arr[7];
				var closed = arr[8];
				var dirAddress = address.replaceAll(" ","+");
				var directions = "https://www.google.com/maps/dir/?api=1&destination=" + dirAddress.replaceAll("'","%2C").replaceAll("|","%7C"); 
				
				$("#contentLeft").empty();
				$("#extra").empty();
				$("#name").empty();
				$("#infoButtons").empty();
				$("#name").append("<p>" + name + "</p>");
				//$("#contentLeft").append("<p><img style=\"border-radius:15%;\" src=\"" + image_url + "\" alt=\"" + name + " class=\"img-fluid center-block\" width=100%\"></p>");
				$("#extra").append("<p>Category: " + title + "</p>");
				$("#extra").append("<p>Status: " + closed + "</p>");
				$("#extra").append("<p>Price: " + price + "</p>");
				$("#extra").append("<p>Rating: " + rating + "</p>");
				$("#extra").append("<p>Phone: " + phone + "</p>");
				$("#extra").append("<p>Address: " + address + "</p>");
				$("#infoButtons").append("<a href=" + url + " class=\"btn-menu animated fadeInUp scrollto\" target=_blank rel=\"noopener noreferrer\">More Info</a>");
				$("#infoButtons").append(" ");
				$("#infoButtons").append("<a href=" + directions + " class=\"btn-menu animated fadeInUp scrollto\" target=_blank rel=\"noopener noreferrer\">Directions</a>");
				
				if(photos.length === 3){
					$("#contentLeft").append("<div id=\"carouselExampleIndicators\" class=\"carousel slide\" data-bs-ride=\"carousel\">  <div class=\"carousel-indicators\">    <button type=\"button\" data-bs-target=\"#carouselExampleIndicators\" data-bs-slide-to=\"0\" class=\"active\" aria-current=\"true\" aria-label=\"Slide 1\"></button>    <button type=\"button\" data-bs-target=\"#carouselExampleIndicators\" data-bs-slide-to=\"1\" aria-label=\"Slide 2\"></button>    <button type=\"button\" data-bs-target=\"#carouselExampleIndicators\" data-bs-slide-to=\"2\" aria-label=\"Slide 3\"></button>  </div>  <div class=\"carousel-inner\">    <div class=\"carousel-item active\">      <img src=\""+photos[0]+"\" class=\"d-block w-100\" alt=\"...\">    </div>    <div class=\"carousel-item\">      <img src=\""+photos[1]+"\" class=\"d-block w-100\" alt=\"...\">    </div>    <div class=\"carousel-item\">      <img src=\""+photos[2]+"\" class=\"d-block w-100\" alt=\"...\">    </div>  </div>  <button class=\"carousel-control-prev\" type=\"button\" data-bs-target=\"#carouselExampleIndicators\" data-bs-slide=\"prev\">    <span class=\"carousel-control-prev-icon\" aria-hidden=\"true\"></span>    <span class=\"visually-hidden\">Previous</span>  </button>  <button class=\"carousel-control-next\" type=\"button\" data-bs-target=\"#carouselExampleIndicators\" data-bs-slide=\"next\">    <span class=\"carousel-control-next-icon\" aria-hidden=\"true\"></span>    <span class=\"visually-hidden\">Next</span>  </button></div>");
				}
				else if(photos.length === 2){
					$("#contentLeft").append("<div id=\"carouselExampleIndicators\" class=\"carousel slide\" data-bs-ride=\"carousel\">  <div class=\"carousel-indicators\">    <button type=\"button\" data-bs-target=\"#carouselExampleIndicators\" data-bs-slide-to=\"0\" class=\"active\" aria-current=\"true\" aria-label=\"Slide 1\"></button>    <button type=\"button\" data-bs-target=\"#carouselExampleIndicators\" data-bs-slide-to=\"1\" aria-label=\"Slide 2\"></button>  </div>  <div class=\"carousel-inner\">    <div class=\"carousel-item active\">      <img src=\""+photos[0]+"\" class=\"d-block w-100\" alt=\"...\">    </div>    <div class=\"carousel-item\">      <img src=\""+photos[1]+"\" class=\"d-block w-100\" alt=\"...\">    </div>  </div>  <button class=\"carousel-control-prev\" type=\"button\" data-bs-target=\"#carouselExampleIndicators\" data-bs-slide=\"prev\">    <span class=\"carousel-control-prev-icon\" aria-hidden=\"true\"></span>    <span class=\"visually-hidden\">Previous</span>  </button>  <button class=\"carousel-control-next\" type=\"button\" data-bs-target=\"#carouselExampleIndicators\" data-bs-slide=\"next\">    <span class=\"carousel-control-next-icon\" aria-hidden=\"true\"></span>    <span class=\"visually-hidden\">Next</span>  </button></div>");
				}
				else if(photo.length === 1){
					$("#contentLeft").append("<div id=\"carouselExampleIndicators\" class=\"carousel slide\" data-bs-ride=\"carousel\">  <div class=\"carousel-indicators\">    <button type=\"button\" data-bs-target=\"#carouselExampleIndicators\" data-bs-slide-to=\"0\" class=\"active\" aria-current=\"true\" aria-label=\"Slide 1\"></button>  </div>  <div class=\"carousel-inner\">    <div class=\"carousel-item active\">      <img src=\""+photos[0]+"\" class=\"d-block w-100\" alt=\"...\">    </div>  </div>  <button class=\"carousel-control-prev\" type=\"button\" data-bs-target=\"#carouselExampleIndicators\" data-bs-slide=\"prev\">    <span class=\"carousel-control-prev-icon\" aria-hidden=\"true\"></span>    <span class=\"visually-hidden\">Previous</span>  </button>  <button class=\"carousel-control-next\" type=\"button\" data-bs-target=\"#carouselExampleIndicators\" data-bs-slide=\"next\">    <span class=\"carousel-control-next-icon\" aria-hidden=\"true\"></span>    <span class=\"visually-hidden\">Next</span>  </button></div>");
				}
			});
		});
		
		//for when we press enter, should be same as above
		$('#location').keypress(function(event){
		    var keycode = (event.keyCode ? event.keyCode : event.which);
		    if(keycode == '13'){
		    	var location = document.getElementById("location").value;
				var send = {location:location};
				$.get("YelpServlet", send, function(data, status){
					//alert("Data: " + data + "\nStatus: " + status);
					if(data === "invalidResult"){
						//var div = document.getElementById('name');
						//div.innerHTML = 'Invalid Search';
						$("#contentLeft").empty();
						$("#extra").empty();
						$("#name").empty();
						$("#infoButtons").empty();
						$("#name").append("<p>Invalid Location</p>");
						$("#extra").append("<p>Please Try A Different Location</p>");
						return;
					}
					var arr = data.split("outputDivider");
					var name = arr[0].replace("?","\'");
					var photos = arr[1].split("imageDivider");
					var price = arr[2].replace("?","\'");
					var rating = arr[3].replace("?","\'");
					var phone = arr[4].replace("?","\'");
					var address = arr[5].replace("?","\'");
					var title = arr[6].replace("?","\'");
					var url = arr[7];
					var closed = arr[8];
					var dirAddress = address.replaceAll(" ","+");
					var directions = "https://www.google.com/maps/dir/?api=1&destination=" + dirAddress.replaceAll("'","%2C").replaceAll("|","%7C"); 
					
					$("#contentLeft").empty();
					$("#extra").empty();
					$("#name").empty();
					$("#infoButtons").empty();
					$("#name").append("<p>" + name + "</p>");
					//$("#contentLeft").append("<p><img style=\"border-radius:15%;\" src=\"" + image_url + "\" alt=\"" + name + " class=\"img-fluid center-block\" width=100%\"></p>");
					$("#extra").append("<p>Category: " + title + "</p>");
					$("#extra").append("<p>Status: " + closed + "</p>");
					$("#extra").append("<p>Price: " + price + "</p>");
					$("#extra").append("<p>Rating: " + rating + "</p>");
					$("#extra").append("<p>Phone: " + phone + "</p>");
					$("#extra").append("<p>Address: " + address + "</p>");
					$("#infoButtons").append("<a href=" + url + " class=\"btn-menu animated fadeInUp scrollto\" target=_blank rel=\"noopener noreferrer\">More Info</a>");
					$("#infoButtons").append(" ");
					$("#infoButtons").append("<a href=" + directions + " class=\"btn-menu animated fadeInUp scrollto\" target=_blank rel=\"noopener noreferrer\">Directions</a>");
					
					if(photos.length === 3){
						$("#contentLeft").append("<div id=\"carouselExampleIndicators\" class=\"carousel slide\" data-bs-ride=\"carousel\">  <div class=\"carousel-indicators\">    <button type=\"button\" data-bs-target=\"#carouselExampleIndicators\" data-bs-slide-to=\"0\" class=\"active\" aria-current=\"true\" aria-label=\"Slide 1\"></button>    <button type=\"button\" data-bs-target=\"#carouselExampleIndicators\" data-bs-slide-to=\"1\" aria-label=\"Slide 2\"></button>    <button type=\"button\" data-bs-target=\"#carouselExampleIndicators\" data-bs-slide-to=\"2\" aria-label=\"Slide 3\"></button>  </div>  <div class=\"carousel-inner\">    <div class=\"carousel-item active\">      <img src=\""+photos[0]+"\" class=\"d-block w-100\" alt=\"...\">    </div>    <div class=\"carousel-item\">      <img src=\""+photos[1]+"\" class=\"d-block w-100\" alt=\"...\">    </div>    <div class=\"carousel-item\">      <img src=\""+photos[2]+"\" class=\"d-block w-100\" alt=\"...\">    </div>  </div>  <button class=\"carousel-control-prev\" type=\"button\" data-bs-target=\"#carouselExampleIndicators\" data-bs-slide=\"prev\">    <span class=\"carousel-control-prev-icon\" aria-hidden=\"true\"></span>    <span class=\"visually-hidden\">Previous</span>  </button>  <button class=\"carousel-control-next\" type=\"button\" data-bs-target=\"#carouselExampleIndicators\" data-bs-slide=\"next\">    <span class=\"carousel-control-next-icon\" aria-hidden=\"true\"></span>    <span class=\"visually-hidden\">Next</span>  </button></div>");
					}
					else if(photos.length === 2){
						$("#contentLeft").append("<div id=\"carouselExampleIndicators\" class=\"carousel slide\" data-bs-ride=\"carousel\">  <div class=\"carousel-indicators\">    <button type=\"button\" data-bs-target=\"#carouselExampleIndicators\" data-bs-slide-to=\"0\" class=\"active\" aria-current=\"true\" aria-label=\"Slide 1\"></button>    <button type=\"button\" data-bs-target=\"#carouselExampleIndicators\" data-bs-slide-to=\"1\" aria-label=\"Slide 2\"></button>  </div>  <div class=\"carousel-inner\">    <div class=\"carousel-item active\">      <img src=\""+photos[0]+"\" class=\"d-block w-100\" alt=\"...\">    </div>    <div class=\"carousel-item\">      <img src=\""+photos[1]+"\" class=\"d-block w-100\" alt=\"...\">    </div>  </div>  <button class=\"carousel-control-prev\" type=\"button\" data-bs-target=\"#carouselExampleIndicators\" data-bs-slide=\"prev\">    <span class=\"carousel-control-prev-icon\" aria-hidden=\"true\"></span>    <span class=\"visually-hidden\">Previous</span>  </button>  <button class=\"carousel-control-next\" type=\"button\" data-bs-target=\"#carouselExampleIndicators\" data-bs-slide=\"next\">    <span class=\"carousel-control-next-icon\" aria-hidden=\"true\"></span>    <span class=\"visually-hidden\">Next</span>  </button></div>");
					}
					else if(photo.length === 1){
						$("#contentLeft").append("<div id=\"carouselExampleIndicators\" class=\"carousel slide\" data-bs-ride=\"carousel\">  <div class=\"carousel-indicators\">    <button type=\"button\" data-bs-target=\"#carouselExampleIndicators\" data-bs-slide-to=\"0\" class=\"active\" aria-current=\"true\" aria-label=\"Slide 1\"></button>  </div>  <div class=\"carousel-inner\">    <div class=\"carousel-item active\">      <img src=\""+photos[0]+"\" class=\"d-block w-100\" alt=\"...\">    </div>  </div>  <button class=\"carousel-control-prev\" type=\"button\" data-bs-target=\"#carouselExampleIndicators\" data-bs-slide=\"prev\">    <span class=\"carousel-control-prev-icon\" aria-hidden=\"true\"></span>    <span class=\"visually-hidden\">Previous</span>  </button>  <button class=\"carousel-control-next\" type=\"button\" data-bs-target=\"#carouselExampleIndicators\" data-bs-slide=\"next\">    <span class=\"carousel-control-next-icon\" aria-hidden=\"true\"></span>    <span class=\"visually-hidden\">Next</span>  </button></div>");
					}
				});
		    }
		});
	});
	
</script>  
</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top d-flex align-items-center">
    <div class="container-fluid container-xl d-flex align-items-center justify-content-lg-between">

      <h1 class="logo me-auto me-lg-0"><a href="index.html">Restaurant Recommender</a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo me-auto me-lg-0"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

   		<div class="input-group mb-3 center d-flex">
			<input type="text" class="form-control" placeholder="Location (City, ZIP, Address, etc.)" aria-label="Location" aria-describedby="basic-addon2" id=location>
			<div class="input-group-append">
 				<button class="btn btn-secondary" type="button" id=search>Search</button>
			</div>
		</div>
    </div>
  </header><!-- End Header -->

  <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex align-items-center">
    <div class="container position-relative text-center text-lg-start" data-aos="zoom-in" data-aos-delay="100">
      <div class="row">
        <div class="col-lg-8">
          <h1 id="name">Welcome to Restaurant Recommender!</h1>
          <h2 id="extra">Enter your location to find a nearby restaurant</h2>

          <div class="btns" id=infoButtons>
          </div>
        </div>
        <div id=contentLeft class="col-lg-4 d-flex position-relative" data-aos="zoom-in" data-aos-delay="200">
        
      	</div>

      </div>
    </div>
  </section><!-- End Hero -->

  <main id="main">


  </main><!-- End #main -->

  <div id="preloader"></div>
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

</body>

</html>