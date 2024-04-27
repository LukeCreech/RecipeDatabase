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

function addRecipe($recipeName, $descr, $cookTime, $imageLink, $ingredients, $costs, $instructions, $categories){
    global $db;   
       
   $query = "INSERT INTO recipe (recipeName, descr, cookTime) VALUES (:recipeName, :descr, :cookTime)";
   $query2 = "INSERT INTO Ingredient (recipeID, ingredientName, cost) VALUES (:recipeID, :ingredientName, :cost)";  
   $query3 = "INSERT INTO Instruction (recipeID, stepNumber, step) VALUES (:recipeID, :stepNumber, :step)";
   $query4 = "INSERT INTO Categorized (categoryID, recipeID) VALUES (:categoryID, :recipeID)";
   $query5 = "INSERT INTO Photo (photoURL) VALUES (:photoURL)";
   $query6 = "INSERT INTO Displays (recipeID, photoID) VALUES (:recipeID, :photoID)";
   $query7 = "INSERT INTO Creates (username, recipeID) VALUES (:username, :recipeID)";
   
   try {
      $statement = $db->prepare($query);
      $statement->bindValue(':recipeName', $recipeName);
      $statement->bindValue(':descr', $descr);
      $statement->bindValue(':cookTime', $cookTime);
      $statement->execute();
      $recipeID = $db->lastInsertId();
      $statement->closeCursor();

      // TODO: FIND A WAY TO GET USERNAME FROM THIS
    //   $statement = $db->prepare($query7);
    //   $statement->bindValue(':recipeID', $recipeID);
    //   $statement->bindValue(':username', "N/A");
    //   $statement->execute();
    //   $statement->closeCursor();
            
      $numIngredients = count($ingredients);
      for ($i = 0; $i < $numIngredients; $i++) {
        $ingredient = $ingredients[$i];
        $cost = $costs[$i];
        $statement = $db->prepare($query2);
        $statement->bindValue(':recipeID', $recipeID);
        $statement->bindValue(':ingredientName', $ingredient);
        $statement->bindValue(':cost', $cost);
        $statement->execute();
        $statement->closeCursor();
      }

      $numInstructions = count($instructions);
      for ($i = 0; $i < $numInstructions; $i++) {
        $instruction = $instructions[$i];
        $statement = $db->prepare($query3);
        $statement->bindValue(':recipeID', $recipeID);
        $statement->bindValue(':stepNumber', $i+1);
        $statement->bindValue(':step', $instruction);
        $statement->execute();
        $statement->closeCursor();
      }

      if (in_array('lunch', $categories)){
        $statement = $db->prepare($query4);
        $statement->bindValue(':categoryID', 1);
        $statement->bindValue(':recipeID', $recipeID);
        $statement->execute();
        $statement->closeCursor();
      }

      if (in_array('salad', $categories)){
        $statement = $db->prepare($query4);
        $statement->bindValue(':categoryID', 2);
        $statement->bindValue(':recipeID', $recipeID);
        $statement->execute();
        $statement->closeCursor();
      }

      if (in_array('sides', $categories)){
        $statement = $db->prepare($query4);
        $statement->bindValue(':categoryID', 3);
        $statement->bindValue(':recipeID', $recipeID);
        $statement->execute();
        $statement->closeCursor();
      }

      if (in_array('healthy', $categories)){
        $statement = $db->prepare($query4);
        $statement->bindValue(':categoryID', 4);
        $statement->bindValue(':recipeID', $recipeID);
        $statement->execute();
        $statement->closeCursor();
      }

      if (in_array('dinner', $categories)){
        $statement = $db->prepare($query4);
        $statement->bindValue(':categoryID', 5);
        $statement->bindValue(':recipeID', $recipeID);
        $statement->execute();
        $statement->closeCursor();
      }

      if (in_array('breakfast', $categories)){
        $statement = $db->prepare($query4);
        $statement->bindValue(':categoryID', 6);
        $statement->bindValue(':recipeID', $recipeID);
        $statement->execute();
        $statement->closeCursor();
      }

      if (in_array('dessert', $categories)){
        $statement = $db->prepare($query4);
        $statement->bindValue(':categoryID', 7);
        $statement->bindValue(':recipeID', $recipeID);
        $statement->execute();
        $statement->closeCursor();
      }

      $statement = $db->prepare($query5);
      $statement->bindValue(':photoURL', $imageLink);
      $statement->execute();
      $photoID = $db->lastInsertId();
      $statement->closeCursor();

      $statement = $db->prepare($query6);
      $statement->bindValue(':recipeID', $recipeID);
      $statement->bindValue(':photoID', $photoID);
      $statement->execute();
      $statement->closeCursor();

   }  catch (PDOException $e)
   {
       echo "Error: " . $e->getMessage();
   } catch (Exception $e)
   {
       echo "Error: " . $e->getMessage();
   }
}
?>