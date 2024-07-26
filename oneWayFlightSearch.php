<?php 
session_start();
if (!isset($_SESSION["username"])) {
    header("Location:blocked.php");
    $_SESSION['url'] = $_SERVER['REQUEST_URI']; 
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Flight Search | tourism_management</title>
    <link href="css/main.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Oswald:200,300,400|Raleway:100,300,400,500|Roboto:100,400,500,700" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/main.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
    <?php include("common/headerLoggedIn.php"); ?>

    <?php
    $type = $_POST["flightType"];
    $class = $_POST["flightClass"];
    $origin = $_POST["origin"];
    $destination = $_POST["destination"];
    $depart = $_POST["depart"];
    $return = isset($_POST["return"]) ? $_POST["return"] : null;
    $adults = $_POST["adults"];
    $children = $_POST["children"];
    $noOfPassengers = (int)$adults + (int)$children;

    if ($class == "Economy Class") {
        $className = "Economy";
    } else {
        $className = "Business";
    }

    echo "<div class='spacer'>a</div>";
    echo "<div class='searchFlights'>";
    echo "<div class='query'>{$type} {$className} Flights from {$origin} to {$destination}</div>";

    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "tourism_db";
    
    $conn = new mysqli($servername, $username, $password, $dbname);
    
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // Debugging: Display SQL query
    $sql = "SELECT * FROM flights WHERE origin='$origin' AND destination='$destination' AND class='$className' ORDER BY seats_available DESC";

    $result = $conn->query($sql);
    if ($result->num_rows > 0) {
        $rowcount = $result->num_rows;
        echo "<div class='noOfFlights'>{$rowcount} flights found.</div>";
        echo "<div class='listItemMenuContainer'>
                <div class='col-sm-2 text-center'><div class='headings'>Operator</div></div>
                <div class='col-sm-2 text-center'><div class='headings'>Departs</div></div>
                <div class='col-sm-2 text-center'><div class='headings'>Arrives</div></div>
                <div class='col-sm-2 text-center'><div class='headings'>Fare</div></div>
                <div class='col-sm-2 text-center'><div class='headings'>Ticket Type</div></div>
                <div class='col-sm-2 text-center'><div class='headings'>Seats Available</div></div>
              </div>
              <div class='spacerLarge'>.</div>";
        
        while ($row = $result->fetch_assoc()) {
            echo "<div class='searchFlights'>
                    <div class='listItem'>
                        <form action='booking.php' method='POST'>
                            <div class='col-sm-2 text-center'>
                                <div class='col-sm-4 text-center'>
                                    <div class='operatorLogo text-center'>";
                                    
                                    // Add proper operator images for Nigerian airlines
                                    if ($row["operator"] == "Air Peace") {
                                        echo "<img src='images/flights/operatorLogos/air_peace.jpg'>";
                                    } elseif ($row["operator"] == "Arik Air") {
                                        echo "<img src='images/flights/operatorLogos/arik_air.jpg'>";
                                    } elseif ($row["operator"] == "Dana Air") {
                                        echo "<img src='images/flights/operatorLogos/dana_air.jpg'>";
                                    } elseif ($row["operator"] == "Azman Air") {
                                        echo "<img src='images/flights/operatorLogos/azman_air.jpg'>";
                                    } else {
                                        echo "<img src='images/flights/operatorLogos/default.jpg'>";
                                    }
                                    
            echo "                </div>
                                </div>
                                <div class='col-sm-8 text-center'>
                                    <div class='values flightOperator'>{$row["operator"]}</div>
                                    <div class='flightNoSubscript'>{$row["flight_no"]}</div>
                                </div>
                            </div>
                            <div class='col-sm-2 text-center'>
                                <div class='values departs'>{$row["departs"]}</div>
                                <div class='departsSubscript'>{$row["origin"]}</div>
                            </div>
                            <div class='col-sm-2 text-center'>
                                <div class='values arrives'>{$row["arrives"]}</div>
                                <div class='arrivesSubscript'>{$row["destination"]}</div>
                            </div>
                            <div class='col-sm-2 text-center'>
                                <div class='values fare'>{$row["fare"]}</div>
                                <div class='fareSubscript'>incl. of GST</div>
                            </div>
                            <div class='col-sm-2 text-center'>
                                <div class='values type'>{$row["refundable"]}</div>
                                <div class='typeSubscript'>{$row["class"]}</div>
                            </div>";

                            $flightNo = $row["flight_no"];
                            $seatsAvailable = (int)$row["seats_available"];
                            if ($seatsAvailable >= $noOfPassengers) {
                                echo "<div class='col-sm-2 text-center' style='border-right: none;'>
                                        <div class='values availabilityGreen'>{$row["seats_available"]}</div>
                                        <div class='availabilitySubscript'>
                                            <input type='submit' class='availabilityBookingButton' value='Book Now'>
                                        </div>
                                      </div>";
                            } else {
                                echo "<div class='col-sm-2 text-center' style='border-right: none;'>
                                        <div class='values availabilityRed'>Unavailable</div>
                                        <div class='unavailabilitySubscript'>Sold Out</div>
                                      </div>";
                            }

            echo "        <input type='hidden' name='typeHidden' value='{$type}'>
                            <input type='hidden' name='classHidden' value='{$class}'>
                            <input type='hidden' name='originHidden' value='{$origin}'>
                            <input type='hidden' name='destinationHidden' value='{$destination}'>
                            <input type='hidden' name='departHidden' value='{$depart}'>";
                            if ($type == "Return Trip") {
                                echo "<input type='hidden' name='returnHidden' value='{$return}'>";
                            }
            echo "        <input type='hidden' name='adultsHidden' value='{$adults}'>
                            <input type='hidden' name='childrenHidden' value='{$children}'>
                            <input type='hidden' name='flightNoOutboundHidden' value='{$row["flight_no"]}'>
                            <input type='hidden' name='modeHidden' value='OneWayFlight'>
                        </form>
                    </div>
                  </div>";
        }
    } else {
        echo "<div class='searchFlights'><div class='noFlights'>No flights found.</div></div>";
    }

    $conn->close();
    ?>

    <div class='spacerLarge'>.</div>
    <?php include("common/footer.php"); ?>
</body>
</html>
