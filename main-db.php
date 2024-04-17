<?php
require ("connect-database.php");
?>

<?php

$loginpage = "user-login.php";

function newAccount($username, $pword)
{
    global $db;
    global $loginpage;
    $query = "INSERT INTO Users (username, pword)
    VALUES (:username, :pword);";
    
    try {
        $statement = $db->prepare($query);
        
        $statement->bindValue(':username', $username);
        $statement->bindValue(':pword', $pword);
        
        $statement->execute();
        $statement->closeCursor();
        
        header("Location: " .$loginpage);
    } catch (PDOException $e)
    {
        echo "Error: " . $e->getMessage();
    } catch (Exception $e)
    {
        echo "Error: " . $e->getMessage();
    }
}

function get_password($username)
{
    global $db;

    $query = "SELECT pword FROM Users
    WHERE username = :username";

    $statement = $db->prepare($query);    
    $statement->bindValue(':username', $username);
    $statement->execute();
    $result = $statement->fetchColumn();
    $statement->closeCursor();
    return $result;
}
?>