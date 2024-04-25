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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="styles.css" rel="stylesheet">
</head>
<body>
<div class="container d-flex justify-content-center align-items-center vh-75">
  <div class="card">
    <div class="card-body">
        <h1 class="text-center">Create a New Account</h1>
            <form action="signup.php" method="post">
                <div class="form-group">
                    <label for="username-field">Username</label>
                    <input type="text" name="username" class="form-control" id="username-field" aria-describedby="emailHelp" placeholder="Username" required /> <br/>
                </div>
                <div class="form-group">
                    <label for="password-field">Password</label>
                    <input type="password" name="password" class="form-control" id="password-field" placeholder="Password" required /> <br/>
                </div>
                <div class="form-group">
                    <label for="password-field">Re-enter Password</label>
                    <input type="password" name="password2" class="form-control" id="password-field" placeholder="Password" required /> <br/>
                </div>
                <div class="login-buttons">
                    <button type="submit" class="btn btn-primary">Submit</button>
                    <button onclick="window.location.href='user-login.php'" class="btn btn-outline-secondary">Return Home</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</body>
</html>