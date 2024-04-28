<?php
require ('navbar.php');
require ('main-db.php');
session_start();
?>

<?php

$favoritespage = "favorites.php";

try
{
    if (isset($_GET['id']))
    {
        $id = $_GET['id'];
        $username = $_SESSION['username'];
        
        // add recipe to favorites
        $remove_favorite_query = "DELETE FROM Favorite WHERE recipeID = :recipeID AND username = :username";
        $statement = $db->prepare($remove_favorite_query);    
        $statement->bindValue(':recipeID', $id);
        $statement->bindValue(':username', $username);
        $statement->execute();
        $statement->closeCursor();

        header("Location: " .$favoritespage);
    }
}
catch (Exception $e)
{
   $error_message = $e->getMessage();
   echo "<p>Error message: $error_message </p>";
}
?>