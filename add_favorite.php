<?php
require ('navbar.php');
require ('main-db.php');
?>

<?php

$favoritespage = "favorites.php";

try
{
    if ($_SERVER['REQUEST_METHOD'] == 'POST')
    {
        $id = $_POST['id'];
        $username = $_POST['username'];

        // check for duplicate
        $duplicate_query = "SELECT * FROM Favorite WHERE recipeID = :recipeID AND username = :username";
        $statement = $db->prepare($duplicate_query);    
        $statement->bindValue(':recipeID', $id);
        $statement->bindValue(':username', $username);
        $statement->execute();
        if ($statement->rowCount() > 0){
            header("Location: " .$favoritespage);
            $statement->closeCursor();
            exit;
        }
        else {
            // add recipe to favorites
            $favorite_query = "INSERT INTO Favorite (recipeID, username) VALUES (:recipeID, :username)";
            $statement = $db->prepare($favorite_query);    
            $statement->bindValue(':recipeID', $id);
            $statement->bindValue(':username', $username);
            $statement->execute();
            $statement->closeCursor();
        }

        header("Location: " .$favoritespage);
    }
}
catch (Exception $e)
{
   $error_message = $e->getMessage();
   echo "<p>Error message: $error_message </p>";
}
?>