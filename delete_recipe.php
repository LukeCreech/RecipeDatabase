<?php
require ('navbar.php');
require ('main-db.php');
?>

<?php

$updatepage = "your-recipes.php";

try
{
    if (isset($_GET['id']))
    {
        $id = $_GET['id'];

        // delete categorized
        $categorized_query = "DELETE FROM Categorized WHERE recipeID = :recipeID";
        $statement = $db->prepare($categorized_query);    
        $statement->bindValue(':recipeID', $id);
        $statement->execute();
        $statement->closeCursor();

        // find photoID
        $photoID_query = "SELECT photoID FROM Photo NATURAL JOIN Displays WHERE recipeID = :recipeID";
        $statement = $db->prepare($photoID_query);    
        $statement->bindValue(':recipeID', $id);
        $statement->execute();
        $statement->closeCursor();
        $photoID_result = $statement->fetchColumn();

        // delete photo
        $photo_query = "DELETE FROM Photo WHERE photoID = :photoID";
        $statement = $db->prepare($photo_query);    
        $statement->bindValue(':photoID', $photoID_result);
        $statement->execute();
        $statement->closeCursor();

        // delete displays
        $displays_query = "DELETE FROM Displays WHERE recipeID = :recipeID";
        $statement = $db->prepare($displays_query);    
        $statement->bindValue(':recipeID', $id);
        $statement->execute();
        $statement->closeCursor();

        // delete ingredient
        $ingredient_query = "DELETE FROM Ingredient WHERE recipeID = :recipeID";
        $statement = $db->prepare($ingredient_query);    
        $statement->bindValue(':recipeID', $id);
        $statement->execute();
        $statement->closeCursor();

        // delete intruction
        $instruction_query = "DELETE FROM Instruction WHERE recipeID = :recipeID";
        $statement = $db->prepare($instruction_query);    
        $statement->bindValue(':recipeID', $id);
        $statement->execute();
        $statement->closeCursor();

        // delete creates
        $creates_query = "DELETE FROM Creates WHERE recipeID = :recipeID";
        $statement = $db->prepare($creates_query);    
        $statement->bindValue(':recipeID', $id);
        $statement->execute();
        $statement->closeCursor();

        // delete recipe
        $recipe_query = "DELETE FROM Recipe WHERE recipeID = :recipeID";
        $statement = $db->prepare($recipe_query);    
        $statement->bindValue(':recipeID', $id);
        $statement->execute();
        $statement->closeCursor();

        header("Location: " .$updatepage);
        exit;
    }
}
catch (Exception $e)
{
   $error_message = $e->getMessage();
   echo "<p>Error message: $error_message </p>";
}
?>

