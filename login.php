<?php
// ------------------- Database Connection -------------------
function getConnection() {
    $host = 'localhost';
    $db   = 'try-on';
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
        die("Connection failed: " . $e->getMessage());
    }
}

// ------------------- LOGIN CHECK -------------------
$message = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['login_user'])) {
    $email = trim($_POST['email'] ?? ''); // match your form input name
    $password = trim($_POST['password'] ?? '');

    if (!empty($email) && !empty($password)) {
        try {
            $pdo = getConnection();
            $stmt = $pdo->prepare("SELECT * FROM users WHERE email_address = ?");
            $stmt->execute([$email]); // use $email here
            $user = $stmt->fetch(PDO::FETCH_ASSOC);

            if ($user && password_verify($password, $user['password'])) {
                // Login success
                echo "<script>window.location.assign('Try-on.html');</script>";
            } else {
                $message = "Invalid email or password.";
            }
        } catch (PDOException $e) {
            $message = "Database error.";
        }
    } else {
        $message = "Both email and password are required.";
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login Check</title>
    <style>
        * {margin:0; padding:0; box-sizing:border-box; font-family:sans-serif;}
        body {min-height:100vh; display:flex; justify-content:center; align-items:center; background: linear-gradient(45deg, pink,aqua);}
        form {display:flex; flex-direction:column; gap:12px; background:white; padding:20px; border-radius:8px; width:300px; max-width:90%;}
        input {padding:12px; border-radius:5px; border:none; background:beige; font-size:16px;}
        button {padding:12px; border-radius:5px; border:none; background:rgb(84,84,225); color:white; font-weight:600; cursor:pointer;}
        button:hover {background:green;}
        h2 {text-align:center; margin-bottom:10px;}
        p.message {text-align:center; font-weight:bold; color:red; margin-bottom:10px;}
    </style>
</head>
<body>
    <?php if (!empty($message)) echo "<p class='message'>$message</p>"; ?>

    <form method="post" autocomplete="off">
        <h2>Login</h2>

        <!-- Always empty: placeholders only -->
        <input type="email" name="email" placeholder="Enter your email" required autocomplete="off">
        <input type="password" name="password" placeholder="Enter your password" required autocomplete="new-password">

        <button type="submit" name="login_user">Login</button>
    </form>
</body>
</html>
