<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | travel_management</title>
    
    <link href="css/admin.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-select.css" rel="stylesheet">
    <link href="css/bootstrap-datetimepicker.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Oswald:200,300,400|Raleway:100,300,400,500|Roboto:100,400,500,700" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/bootstrap-select.js"></script>
    <script src="js/bootstrap-dropdown.js"></script>
    <script src="js/jquery-2.1.1.min.js"></script>
    <script src="js/moment-with-locales.js"></script>
    <script src="js/bootstrap-datetimepicker.js"></script>
</head>
<body>
    <div class="container-fluid">
        <div class="login">
            <div class="col-sm-12">
                <div class="heading text-center">
                    Login
                </div>
            </div>
            <div class="col-sm-12">
                <div class="containerBox">
                    <form action="" method="POST">
                        <label for="username">Username:</label>
                        <input type="text" class="input" name="username" placeholder="Enter username here" required>
                        <label for="password">Password:</label>
                        <input type="password" class="input" name="password" placeholder="Enter password here" required>
                        <div class="col-sm-12 text-center">
                            <input type="submit" class="button" name="but_submit" value="Login">
                        </div>
                        <!-- <a href="forgotPassword.php"><p class="dots">Forgot Password?</p></a> -->
                    </form>
                    <div class="col-sm-12 text-center">
                        <div class="signupPrompt">
                            <!-- New user? <a href="signup.php">Sign Up</a> instead. -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <?php
    session_start();

    $servername = "localhost";
    $usernameConn = "root";
    $passwordConn = "";
    $dbname = "tourism_db";

    // Creating a connection to tourism_db MySQL database
    $conn = mysqli_connect($servername, $usernameConn, $passwordConn, $dbname);

    // Checking if we've successfully connected to the database
    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    }

    if (isset($_POST['but_submit'])) {
        $username = mysqli_real_escape_string($conn, $_POST['username']);
        $password = mysqli_real_escape_string($conn, $_POST['password']);

        if ($username != "" && $password != "") {
            $sql_query = "SELECT password FROM admin WHERE username='$username'";
            $result = mysqli_query($conn, $sql_query);

            if ($result && mysqli_num_rows($result) > 0) {
                $row = mysqli_fetch_assoc($result);
                
                if ($password === $row['password']) {
                    $_SESSION['username'] = $username;
                    header('Location: Home.php');
                    exit(); // Ensure no further code is executed after redirect
                } else {
                    echo "<h4 class='text-center bg-danger' style='font-weight:bold;'>Invalid username and password</h4>";
                }
            } else {
                echo "<h4 class='text-center bg-danger' style='font-weight:bold;'>Invalid username and password</h4>";
            }
        }
    }

    mysqli_close($conn);
    ?>
</body>
</html>
