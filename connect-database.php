<?php

# used the following link for help on setting up a .env file https://stackoverflow.com/questions/67963371/load-a-env-file-with-php

$env = parse_ini_file('.env');

$username = $env["database_username"]; 
$password = $env["database_password"];
$host = $env["database_host"];
$dbname = $env["database_name"];
$dsn = "mysql:host=$host;dbname=$dbname";

try 
{
   $db = new PDO($dsn, $username, $password);
}
catch (PDOException $e)
{
   $error_message = $e->getMessage();        
   echo "<p>An error occurred while connecting to the database: $error_message </p>";
}
catch (Exception $e)
{
   $error_message = $e->getMessage();
   echo "<p>Error message: $error_message </p>";
}
?>