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
<form action="login.php" method="post">     
    Username: <input type="text" name="username" required /> <br/>
    Password: <input type="password" name="password" required /> <br/>
    <input type="submit" value="Submit" class="btn" />
</form>

<?php
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
            header("Location: " .$homepage);
            exit;
        }
        else
            echo "<span class='msg'>Incorrect login information.</span> <br/>"
    }
}
function get_password($username)
{

}

$homepage = "homepage.php"
login();
?>

</body>
</html>