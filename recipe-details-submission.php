<?php
require ('navbar.php');
require ("main-db.php");
session_start();
?>

<?php

$homepage = "homepage.php";

try
{
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        if(!empty($_POST['addCBtn'])){
    
            $addC_query = "INSERT INTO Comment (username, recipeID, commentText) VALUES (:username, :recipeID, :commentText)";
            $statement = $db->prepare($addC_query);
            $statement->bindValue(':username', $_POST['username']);
            $statement->bindValue(':recipeID', $_POST['id']);
            $statement->bindValue(':commentText', $_POST['addComment']);
            $statement->execute();
            $statement->closeCursor();
            
            $comments_query = "SELECT C.username, C.commentText FROM Comment C NATURAL JOIN Recipe R
            WHERE R.recipeID = :recipeID";
            $statement = $db->prepare($comments_query);
            $statement->bindValue(':recipeID', $id);
            $statement->execute();
            $comments_result = $statement->fetchAll();
            $statement->closeCursor();
            header("Location: " .$homepage);
        }
    
        if(!empty($_POST['addRBtn'])){
            $addR_query = "INSERT INTO Rating (username, recipeID, score) VALUES (:username, :recipeID, :score)";
            $statement = $db->prepare($addR_query);
            $statement->bindValue(':username', $_POST['username']);
            $statement->bindValue(':recipeID', $_POST['id']);
            $statement->bindValue(':score', $_POST['addRating']);
            $statement->execute();
            $statement->closeCursor();
    
            $avg_query = "SELECT ROUND(AVG(score), 1) AS avg FROM Recipe NATURAL JOIN Rating WHERE recipeID = :recipeID GROUP BY recipeID";
            $statement = $db->prepare($avg_query);
            $statement->bindValue(':recipeID', $id);
            $statement->execute();
            $avg_result = $statement->fetchAll();
            $statement->closeCursor();
            header("Location: " .$homepage);
        }
    
        if(!empty($_POST['updateRBtn'])){
            $updateR_query = "UPDATE Rating SET score = :updatedRating WHERE username = :username AND recipeID = :recipeID";
            $statement = $db->prepare($updateR_query);
            $statement->bindValue(':updatedRating', $_POST['updateRating']);
            $statement->bindValue(':username', $_POST['username']);
            $statement->bindValue(':recipeID', $_POST['id']);
            $statement->execute();
            $avg_result = $statement->fetchAll();
            $statement->closeCursor();
    
            $avg_query = "SELECT ROUND(AVG(score), 1) AS avg FROM Recipe NATURAL JOIN Rating WHERE recipeID = :recipeID GROUP BY recipeID";
            $statement = $db->prepare($avg_query);
            $statement->bindValue(':recipeID', $id);
            $statement->execute();
            $avg_result = $statement->fetchAll();
            $statement->closeCursor();
            header("Location: " .$homepage);
        }
    }
}
catch (Exception $e)
{
   $error_message = $e->getMessage();
   echo "<p>Error message: $error_message </p>";
}
