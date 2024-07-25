<?php session_start();
if(!isset($_SESSION["username"]))
{
    header("Location:blockedBooking.php");
    $_SESSION['url'] = $_SERVER['REQUEST_URI']; 
}
?>

<!DOCTYPE html>

<html lang="en">
	
	<!-- HEAD TAG STARTS -->

	<head>
	
  		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
		<title>Coming Soon | tourism_management</title>
    
    	<link href="css/main.css" rel="stylesheet">
    	<link href="css/bootstrap.min.css" rel="stylesheet">
    	<link href="https://fonts.googleapis.com/css?family=Oswald:200,300,400|Raleway:100,300,400,500|Roboto:100,400,500,700" rel="stylesheet">
    	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    
    	<script src="js/jquery-3.2.1.min.js"></script>
    	<script src="js/main.js"></script>
    	<script src="js/bootstrap.min.js"></script>
	</head>
	
	<!-- HEAD TAG ENDS -->
	
	<!-- BODY TAG STARTS -->
	
	<body>
	
		<div class="container-fluid">
		
			<div class="coming-soon col-sm-12">
			
			<!-- HEADER SECTION STARTS -->
				
				<div class="col-sm-12">
					
					<div class="header">
					
						<?php include("common/headerTransparentLoggedIn.php"); ?>
					
						<div class="col-sm-12">
						
						<div class="menu text-center">
							
							<ul>
								<a href="hotels.php"><li>Hotels</li></a>
								<a href="flights.php"><li>Flights</li></a>
								<li class="selected">Trains</li>
							</ul>
							
						</div>
						
					</div>
					
					</div> <!-- header -->
				
				</div> <!-- col-sm-12 -->
				
			<!-- HEADER SECTION ENDS -->
				
				
			<!-- COMING SOON SECTION STARTS -->
				
				<div class="col-sm-12">
					
					<div class="coming-soon-content text-center">
   					
    					<div class="content">
    						<h1>Coming Soon!</h1>
    						<p>We're working hard to bring you an amazing train booking experience.</p>
    						<p>Stay tuned for updates!</p>
    						<img src="images/coming-soon.jpg" alt="Coming Soon" class="img-responsive center-block" style="max-width: 600px; margin: 20px auto;">
    					</div> <!-- content -->
    					
					</div> <!-- coming-soon-content -->
					
				</div> <!-- col-sm-12 -->
			
			<!-- COMING SOON SECTION ENDS -->
				
			</div> <!-- coming-soon -->	
			
			<!-- FOOTER SECTION STARTS -->
					
				<div class="footer col-sm-12">
					
					<div class="col-sm-4">
						
					<div class="footerHeading">
							Contact Us
						</div>
							
						<div class="footerText">
							Central Area <br> Abuja, Nigeria
						</div>
				
						<div class="footerText">
							E-mail: jibrilla@tourism_system.com
						</div>
						
					</div>
					
					<div class="col-sm-4">
						
					</div>
					
					<div class="col-sm-4">
					
						<div class="footerHeading">
							Social Links
						</div>
						
						<div class="socialLinks">
						
							<div class="fb">
								facebook.com/tourism_management
							</div>
						
							<div class="gp">
								plus.google.com/tourism_management
							</div>
						
							<div class="tw">
								twitter.com/tourism_management
							</div>
						
							<div class="in">
								linkedin.com/tourism_management
							</div>
						
						</div> <!-- social links -->
						
					</div>
						
					<div class="col-sm-12">
					<div class="copyrightContainer">
						<div class="copyright">
						Copyright &copy; 2024 MMM
						</div>
					</div>
					</div>
							
				</div> <!-- footer -->
				
			<!-- FOOTER SECTION ENDS -->
			
		</div> <!-- container-fluid -->
	
	</body>
	
	<!-- BODY TAG ENDS -->
	
</html>
