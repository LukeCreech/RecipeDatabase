<?php
$username = 'lmc3axn'; 
$password = 'Hawaii08!';
$host = 'mysql01.cs.virginia.edu';
$dbname = 'lmc3axn_b';
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