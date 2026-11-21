<?php
// 🔴 SHOW ERRORS
error_reporting(E_ALL);
ini_set('display_errors', 1);

include("database.php");

if (isset($_POST['register_user'])) {

    $email = $_POST['email'];
    $password = $_POST['password'];

    if (empty($email) || empty($password)) {
        echo "All fields are required";
        exit();
    }

    // 🔍 CHECK EMAIL
    $check_email = "SELECT * FROM user_table WHERE email='$email'";
    $run_email = mysqli_query($conn, $check_email);

    if (!$run_email) {
        die("Query Error: " . mysqli_error($conn));
    }

    if (mysqli_num_rows($run_email) > 0) {
        echo "Email already exists";
        exit();
    }

    // 🔐 HASH PASSWORD
    $hashed_password = password_hash($password, PASSWORD_DEFAULT);

    // ✅ INSERT
    $insert = "INSERT INTO user_table (email, password) 
               VALUES ('$email', '$hashed_password')";

    if (mysqli_query($conn, $insert)) {
        echo "✅ Registration successful";
    } else {
        echo "❌ Insert Error: " . mysqli_error($conn);
    }
}
?>