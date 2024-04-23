<?php
require ("connect-database.php");
require ("main-db.php");
?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">   
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
    <title>Login</title>
</head>
<body>

<h1>User Login</h1>
<form action="user-login.php" method="post">     
    Username: <input type="text" name="username" required /> <br/>
    Password: <input type="password" name="password" required /> <br/>
    <input type="submit" value="Submit" class="btn" />
</form>
<button onclick="window.location.href='signup.php'">Create Account</button>

<?php
session_start();

$homepage = "homepage.php";

if(isset($_SESSION["authenticated"]) && $_SESSION["authenticated"] === true)
{
    header("Location: " .$homepage);
    exit;
}

function login()
{
    global $homepage;
    
    if ($_SERVER['REQUEST_METHOD'] == 'POST')
    {
        $username = $_POST['username'];
        $password = htmlspecialchars($_POST['password']);
        $hash = get_password($username);
        if (password_verify($password, $hash))
        {
            // redirect to mainpage if valid login
            $_SESSION["authenticated"] = true;
            $_SESSION["username"] = $username; 
            header("Location: " .$homepage);
            exit;
        }
        else
            echo "<span class='msg'>Incorrect login information.</span> <br/>";
    }
}


login();
?>

</body>
</html>