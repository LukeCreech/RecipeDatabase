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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="styles.css" rel="stylesheet">
</head>
<body>

<div class="container d-flex justify-content-center align-items-center vh-75">
  <div class="card">
    <div class="card-body">
        <h1 class="text-center">Login</h1>
            <form action="user-login.php" method="post">
                <div class="form-group">
                    <label for="username-field">Username</label>
                    <input type="text" name="username" class="form-control" id="username-field" aria-describedby="emailHelp" placeholder="Username" required /> <br/>
                </div>
                <div class="form-group">
                    <label for="password-field">Password</label>
                    <input type="password" name="password" class="form-control" id="password-field" placeholder="Password" required /> <br/>
                </div>
                <div id="bad-login" class="text-danger" style="display: none;">Incorrect login information.</div>
                <div class="login-buttons">
                    <button type="submit" class="btn btn-primary">Submit</button>
                    <button onclick="window.location.href='signup.php'" class="btn btn-outline-secondary">Create Account</button>
                </div>
            </form>
        </div>
    </div>
</div>

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
            echo "<script>document.getElementById('bad-login').style.display = 'block';</script>";
    }
}


login();
?>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</body>
</html>