<?php
session_start();
require ('navbar.php');
require ('main-db.php');
require ("connect-database.php");
?>

<?php

$updatepage = "your-recipes.php";

try
{
    if ($_SERVER['REQUEST_METHOD'] == 'POST')
    {
        // update recipe name
        $id = $_POST['recipe-id'];
        $name_query = "UPDATE Recipe SET recipeName = :recipeName WHERE recipeID = :recipeID";
        $statement = $db->prepare($name_query);    
        $statement->bindValue(':recipeID', $id);
        $statement->bindValue(':recipeName', $_POST['recipe-name']);
        $statement->execute();
        $statement->closeCursor();

        // update cook time
        $time_query = "UPDATE Recipe SET cookTime = :cookTime WHERE recipeID = :recipeID";
        $statement = $db->prepare($time_query);    
        $statement->bindValue(':recipeID', $id);
        $statement->bindValue(':cookTime', $_POST['cook-time']);
        $statement->execute();
        $statement->closeCursor();

        // update ingredients
        $index = 0;
        foreach ($_POST as $key => $value)
        {
            if (strpos($key, 'ingredient-') === 0) 
            {
                $index = substr($key, strlen('ingredient-'));
                $ingredientName = $value;
                $cost = $_POST['cost-' . $index];
                $old_ingredient = $_POST['old-ingredient-' . $index];
                $ingredient_query = "UPDATE Ingredient SET cost = :cost, ingredientName = :ingredientName 
                WHERE recipeID = :recipeID AND ingredientName = :oldIngredientName";
                $statement = $db->prepare($ingredient_query);    
                $statement->bindValue(':recipeID', $id);
                $statement->bindValue(':ingredientName', $ingredientName);
                $statement->bindValue(':cost', $cost);
                $statement->bindValue(':oldIngredientName', $old_ingredient);
                $statement->execute();
                $statement->closeCursor();
            }
        }

        // update instructions
        $index = 0;
        foreach ($_POST as $key => $value)
        {
            if (strpos($key, 'instruction-') === 0) 
            {
                $index = substr($key, strlen('instruction-'));
                $instructionText = $value;
                $stepNumber = $_POST['step-number-' . $index];
                $ingredient_query = "UPDATE Instruction SET step = :instructionText
                WHERE recipeID = :recipeID AND stepNumber = :stepNumber";
                $statement = $db->prepare($ingredient_query);    
                $statement->bindValue(':recipeID', $id);
                $statement->bindValue(':instructionText', $instructionText);
                $statement->bindValue(':stepNumber', $stepNumber);
                $statement->execute();
                $statement->closeCursor();
            }
        }

        // update photoURL
        $photo_query = "UPDATE Photo NATURAL JOIN Displays SET photoURL = :photoURL WHERE recipeID = :recipeID";
        $statement = $db->prepare($photo_query);    
        $statement->bindValue(':recipeID', $id);
        $statement->bindValue(':photoURL', $_POST['photo-url']);
        $statement->execute();
        $statement->closeCursor();

        header("Location: " .$updatepage);
    }
}
catch (Exception $e)
{
   $error_message = $e->getMessage();
   echo "<p>Error message: $error_message </p>";
}

?>