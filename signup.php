<?php
require ("connect-database.php");
require ("main-db.php");
?>

<?php
session_start();

$homepage = "homepage.php";

$loginpage = "user-login.php";

if(session_status() === PHP_SESSION_NONE)
{
    header("Location: " .$loginpage);
    exit;
}

if(isset($_SESSION["authenticated"]) && $_SESSION["authenticated"] === true)
{
    header("Location: " .$homepage);
    exit;
}

function create_account()
{
    global $loginpage;
    global $db;

    if ($_SERVER['REQUEST_METHOD'] == 'POST')
    {
        $username = $_POST['username'];
        $passwd = htmlspecialchars($_POST['password']);
        $passwd2 = htmlspecialchars($_POST['password2']);
        if($passwd === $passwd2)
        {
            $pword = password_hash($passwd, PASSWORD_DEFAULT);
            newAccount($username, $pword);
        }
        else
            echo "<span class='msg'>Passwords do not match.</span> <br/>";
    }

}
create_account();

?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">   
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
    <title>Sign Up</title>
</head>
<body>

<h1>Create A New Account</h1>
<form action="signup.php" method="post">     
    Username: <input type="text" name="username" required /> <br/>
    Password: <input type="password" name="password" required /> <br/>
    Re-enter Password: <input type="password" name="password2" required /> <br/>
    <input type="submit" value="Submit" class="btn" />
</form>

</body>
</html>