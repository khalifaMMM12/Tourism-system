<?php session_start();
if(!isset($_SESSION["username"]))
{
    	header("Location:blocked.php");
   		$_SESSION['url'] = $_SERVER['REQUEST_URI']; 
}
?>

<?php
	
	$servername = "localhost";
	$username = "root";
	$password = "";
	$dbname = "tourism_db";
	
	// Creating a connection to MySQL database
	$conn = new mysqli($servername, $username, $password, $dbname);
	
	// Checking if successfully connected to the database
	if ($conn->connect_error) {
		die("Connection failed: " . $conn->connect_error);
	}

	$user = $_SESSION["username"];
	$id = $_POST["bookingID"];


	$cancelTrainBookingsSQL = "UPDATE `trainbookings` SET cancelled='yes' WHERE bookingID='$id'";
	$cancelTrainBookingsQuery = $conn->query($cancelTrainBookingsSQL);

	/*-------------------------------------------------------------------------------
	
	
				updated train tickrts cancellation status
	
	
	-------------------------------------------------------------------------------*/


?>