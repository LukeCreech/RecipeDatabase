<?php
session_start();

$loginpage = "user-login.php";

if(isset($_SESSION["authenticated"]) && $_SESSION["authenticated"] === true)
{
    $_SESSION = array();
    session_destroy();
    header("Location: " .$loginpage);
    exit;
}
?>