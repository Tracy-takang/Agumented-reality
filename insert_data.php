<?php
// ------------------- Database Connection -------------------
function getConnection() {
    $host = 'localhost';
    $db   = 'try-on';  // Database name
    $user = 'root';
    $pass = '';
    $charset = 'utf8mb4';
    $dsn = "mysql:host=$host;dbname=$db;charset=$charset";

    try {
        $pdo = new PDO($dsn, $user, $pass, [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
        ]);
        return $pdo;
    } catch (PDOException $e) {
        echo "Connection failed: " . $e->getMessage();
        exit;
    }
}

$message = '';

// --------------------- REGISTRATION ---------------------
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['register_user'])) {
    $first_name    = $_POST['firstname'] ?? '';
    $last_name     = $_POST['lastname'] ?? '';
    $email_address = $_POST['email'] ?? '';
    $date_of_birth = $_POST['dob'] ?? '';
    $location      = $_POST['location'] ?? '';
    $password      = $_POST['password'] ?? '';
    $confirmpass   = $_POST['confirm_password'] ?? '';
    $phone         = $_POST['phone'] ?? '';

    if (!empty($first_name) && !empty($last_name) && !empty($email_address) && !empty($date_of_birth) && !empty($location) && !empty($password) && !empty($confirmpass) && !empty($phone)) {
        if (!filter_var($email_address, FILTER_VALIDATE_EMAIL)) {
            $message = "Invalid email format.";
        } elseif (strlen($password) < 6) {
            $message = "Password must be at least 6 characters.";
        } elseif ($password !== $confirmpass) {
            $message = "Passwords do not match.";
        } else {
            try {
                $pdo = getConnection();

                // Check if email already exists
                $checkStmt = $pdo->prepare("SELECT id FROM users WHERE email_address=?");
                $checkStmt->execute([$email_address]);
                if ($checkStmt->rowCount() > 0) {
                    $message = "Email already registered.";
                } else {
                    $hashedPassword = password_hash($password, PASSWORD_BCRYPT);

                    $stmt = $pdo->prepare(
                        "INSERT INTO users (first_name, last_name, email_address, date_of_birth, location, password, phone) 
                         VALUES (?, ?, ?, ?, ?, ?, ?)"
                    );

                    if ($stmt->execute([$first_name, $last_name, $email_address, $date_of_birth, $location, $hashedPassword, $phone])) {
                        $message = "User registered successfully!<a href='Try-on.html'>Continue</a>";
                    } else {
                        $message = "Error: Could not insert record.";
                    }
                }

            } catch (PDOException $e) {
                $message = "Database error: " . $e->getMessage();
            }
        }
    } else {
        $message = "All registration fields are required.";
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>User Registration</title>
    <style>
      *{
        margin: 0;
        padding: 0;
        font-family: sans-serif;
        box-sizing: border-box;
      }
      body{
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        background: linear-gradient(45deg, pink, aqua);
      }
      form{
        display: flex;
        flex-direction: column;
        gap: 12px;
        padding: 20px 30px;
        background-color: white;
        border-radius: 5px;
        width: 350px;
      }
      .formgroup{
        display: flex;
        flex-direction: column;
        gap: 5px;
      }
      input{
        padding: 12px 16px;
        font-size: 16px;
        border-radius: 5px;
        border: none;
        background-color: beige;
      }
      button{
        background-color: rgb(84, 84, 225);
        padding: 12px 16px;
        border-radius: 5px;
        border: none;
        color: white;
        font-size: 18px;
        font-weight: 600;
        cursor: pointer;
      }
      button:hover{
        color: aliceblue;
        background-color: green;
      }
      h2{
        text-align: center;
        margin-bottom: 10px;
      }
      p.message{
        text-align: center;
        font-weight: bold;
        color: red;
        margin-bottom: 10px;
      }
    </style>
</head>
<body>
    <?php if (!empty($message)) echo "<p class='message'>$message</p>"; ?>

    <form method="post">
        <h2>REGISTER USER</h2>

        <div class="formgroup">
          <label>first_name:</label>
          <input type="text" name="firstname" placeholder="Enter your first name" required>
        </div>

        <div class="formgroup">
          <label>last_name:</label>
          <input type="text" name="lastname" placeholder="Enter your last name" required>
        </div>

        <div class="formgroup">
          <label>email_address:</label>
          <input type="email" name="email" placeholder="Enter your email" required>
        </div>


        <div class="formgroup">
          <label>date_of_birth:</label>
          <input type="date" name="dob" placeholder="Select your birth date" required>
        </div>

        <div class="formgroup">
          <label>location:</label>
          <input type="text" name="location" placeholder="Enter your location" required>
        </div>

        <div class="formgroup">
          <label>password:</label>
          <input type="password" name="password" placeholder="Enter your password" required>
        </div>

        <div class="formgroup">
          <label>confirm password:</label>
          <input type="password" name="confirm_password" placeholder="Confirm your password" required>
        </div>

        <div class="formgroup">
          <label>phone:</label>
          <input type="text" name="phone" placeholder="+237670093629" required>
        </div>


        <button type="submit" name="register_user">Register</button>
    </form>
</body>
</html>
