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

function getAllRecipes()
{
    global $db;
    $query = "SELECT * FROM Recipe NATURAL JOIN Rating ORDER BY recipeID ASC";
    $statement = $db->prepare($query);
    $statement->execute();
    $result = $statement->fetchAll();
    $statement->closeCursor();
    return $result;
}

function getBreakfast()
{
    global $db;
    $query = "SELECT * FROM Recipe NATURAL JOIN Rating NATURAL JOIN Categorized WHERE categoryID=6 ORDER BY recipeID ASC";
    $statement = $db->prepare($query);
    $statement->execute();
    $result = $statement->fetchAll();
    $statement->closeCursor();
    return $result;
}

function getLunch()
{
    global $db;
    $query = "SELECT * FROM Recipe NATURAL JOIN Rating NATURAL JOIN Categorized WHERE categoryID=1 ORDER BY recipeID ASC";
    $statement = $db->prepare($query);
    $statement->execute();
    $result = $statement->fetchAll();
    $statement->closeCursor();
    return $result;
}

function getDinner()
{
    global $db;
    $query = "SELECT * FROM Recipe NATURAL JOIN Rating NATURAL JOIN Categorized WHERE categoryID=5 ORDER BY recipeID ASC";
    $statement = $db->prepare($query);
    $statement->execute();
    $result = $statement->fetchAll();
    $statement->closeCursor();
    return $result;
}

function getSides()
{
    global $db;
    $query = "SELECT * FROM Recipe NATURAL JOIN Rating NATURAL JOIN Categorized WHERE categoryID=3 ORDER BY recipeID ASC";
    $statement = $db->prepare($query);
    $statement->execute();
    $result = $statement->fetchAll();
    $statement->closeCursor();
    return $result;
}

function getSalads()
{
    global $db;
    $query = "SELECT * FROM Recipe NATURAL JOIN Rating NATURAL JOIN Categorized WHERE categoryID=2 ORDER BY recipeID ASC";
    $statement = $db->prepare($query);
    $statement->execute();
    $result = $statement->fetchAll();
    $statement->closeCursor();
    return $result;
}

function getDessert()
{
    global $db;
    $query = "SELECT * FROM Recipe NATURAL JOIN Rating NATURAL JOIN categorized WHERE categoryID=7 ORDER BY recipeID ASC";
    $statement = $db->prepare($query);
    $statement->execute();
    $result = $statement->fetchAll();
    $statement->closeCursor();
    return $result;
}

function getHealthy()
{
    global $db;
    $query = "SELECT * FROM Recipe NATURAL JOIN Rating NATURAL JOIN categorized WHERE categoryID=4 ORDER BY recipeID ASC";
    $statement = $db->prepare($query);
    $statement->execute();
    $result = $statement->fetchAll();
    $statement->closeCursor();
    return $result;
}

function getCost($recipeID)
{
    global $db;
    $query = "CALL countPrice(:recipeID);";
    $statement = $db->prepare($query);
    $statement->bindParam(':recipeID', $recipeID, PDO::PARAM_INT);
    $statement->execute();
    $result = $statement->fetchAll();
    $statement->closeCursor();
    return $result;
}
?>