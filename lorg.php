<?php
session_start();

// Database connection
$servername = "localhost";
$dbusername = "root"; // your DB username
$dbpassword = "";     // your DB password
$dbname = "try-on";

$conn = new mysqli($servername, $dbusername, $dbpassword, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Initialize message
$message = "";

// Handle logout
if (isset($_GET['action']) && $_GET['action'] == 'logout') {
    session_destroy();
    header("Location: ".$_SERVER['PHP_SELF']);
    exit();
}

// Handle form submissions
if ($_SERVER["REQUEST_METHOD"] == "POST") {

    // SIGNUP
    if (isset($_POST['signup'])) {
        $name = trim($_POST['name']);
        $email = trim($_POST['email']);
        $password = password_hash($_POST['password'], PASSWORD_DEFAULT);

        // Check if email already exists
        $check = $conn->prepare("SELECT id FROM `users` WHERE email_address=?");
        $check->bind_param("s", $email_address);
        $check->execute();
        $check->store_result();

        if ($check->num_rows > 0) {
            $message = "Information exists!";
        } else {
            // Insert new user
            $stmt = $conn->prepare("INSERT INTO `users` (name, email_address, password) VALUES (?, ?, ?)");
            $stmt->bind_param("sss", $name, $email_address, $password);
            if ($stmt->execute()) {
                $_SESSION['users'] = $name;
                $_SESSION['page'] = 'welcome';
            } else {
                $message = "Error: " . $stmt->error;
            }
            $stmt->close();
        }
        $check->close();
    }

    // LOGIN
    if (isset($_POST['login'])) {
        $email = trim($_POST['email_address']);
        $password = $_POST['password'];

        $stmt = $conn->prepare("SELECT name, password FROM `users` WHERE email_address=?");
        $stmt->bind_param("s", $email_address);
        $stmt->execute();
        $stmt->store_result();
        $stmt->bind_result($name, $hashedPassword);

        if ($stmt->num_rows == 1) {
            $stmt->fetch();
            if (password_verify($password, $hashedPassword)) {
                $_SESSION['users'] = $name;
                $_SESSION['page'] = 'homepage';
            } else {
                $message = "Incorrect password!";
            }
        } else {
            $message = "User not found!";
        }

        $stmt->close();
    }
}

// Determine which page to show
$page = isset($_SESSION['page']) ? $_SESSION['page'] : 'login';

$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login & Signup System</title>
<style>
    body {margin:0; font-family:Arial,sans-serif; background:#f4f6f9; display:flex; flex-direction:column; align-items:center;}
    header {width:100%; background-color:#007BFF; padding:20px; text-align:center; color:white; font-size:24px; font-weight:bold;}
    .container {margin-top:50px; background:white; width:350px; padding:20px; border-radius:10px; box-shadow:0 4px 8px rgba(0,0,0,0.1);}
    .form-header {display:flex; justify-content:space-between; margin-bottom:20px;}
    .form-header button {width:50%; padding:10px; border:none; cursor:pointer; font-weight:bold; background:#ddd; transition:0.3s;}
    .form-header button.active {background:#007BFF; color:white;}
    form {display:flex; flex-direction:column;}
    form input {margin-bottom:15px; padding:10px; border:1px solid #ccc; border-radius:5px;}
    form button {padding:10px; background:#007BFF; border:none; color:white; font-size:16px; border-radius:5px; cursor:pointer;}
    form button:hover {background:#0056b3;}
    .message {text-align:center; margin-bottom:10px; color:green; font-weight:bold;}
    .logout {margin-top:20px; text-align:center;}
</style>
</head>
<body>
<header>My Login System</header>

<div class="container">
<?php if($page == 'login' || $page == 'signup'): ?>
    <div class="message"><?php echo $message; ?></div>
    <div class="form-header">
        <button onclick="showLogin()" id="loginBtn" class="<?php echo $page=='login'?'active':''; ?>">Login</button>
        <button onclick="showSignup()" id="siginBtn" class="<?php echo $page=='signup'?'active':''; ?>">Signup</button>
    </div>

    <form id="loginForm" method="post" style="display:<?php echo $page=='login'?'flex':'none'; ?>">
        <input type="email" name="email" placeholder="Enter Email" required>
        <input type="password" name="password" placeholder="Enter Password" required>
        <button type="submit" name="login">Login</button>
    </form>

    <form id="signupForm" method="post" style="display:<?php echo $page=='signup'?'flex':'none'; ?>">
        <input type="text" name="name" placeholder="Enter Name" required>
        <input type="email" name="email" placeholder="Enter Email" required>
        <input type="password" name="password" placeholder="Enter Password" required>
        <button type="submit" name="signup">Signup</button>
    </form>

<?php elseif($page == 'welcome'): ?>
    <h2>Welcome, <?php echo $_SESSION['user']; ?>!</h2>
    <p>Your signup was successful.</p>
    <div class="logout"><a href="?action=logout">Logout</a></div>

<?php elseif($page == 'homepage'): ?>
    <h2>Hello, <?php echo $_SESSION['user']; ?>!</h2>
    <p>You have successfully logged in.</p>
    <div class="logout"><a href="?action=logout">Logout</a></div>
<?php endif; ?>
</div>

<script>
let loginForm = document.getElementById("loginForm");
let signupForm = document.getElementById("signupForm");
let loginBtn = document.getElementById("loginBtn");
let signupBtn = document.getElementById("signupBtn");

function showLogin() {
    loginForm.style.display = "flex";
    signupForm.style.display = "none";
    loginBtn.classList.add("active");
    signupBtn.classList.remove("active");
}

function showSignup() {
    loginForm.style.display = "none";
    signupForm.style.display = "flex";
    signupBtn.classList.add("active");
    loginBtn.classList.remove("active");
}
</script>
</body>
</html>
