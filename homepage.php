<?php
session_start();
include("database.php");
?>




<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>homepage</title>
</head>
<body>
    <div style="text-align:center; padding:15%;">
    <p style=" font_size:50px; font-weight:bold;">
        Hello, <?php
        if(issert($_session['email'])){
            $mail =$_session['email];
            $query =mysqli_query($conn,"select *from user_table where email ='$mail'";']
            while($row=mysqli_fetch_array($query)){
                echo $row['email']
            }
        }
        ?>
    </p>
    
    </div>
</body>
</html>
