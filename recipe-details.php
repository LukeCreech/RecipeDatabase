<?php
require ('navbar.php');
require ("main-db.php");
session_start();
?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">   
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
    <title>Budget Recipe Database</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>

<?php

if (isset($_GET['id']))
{
    $id = $_GET['id'];

    // find User that created recipe
    $user_query = "SELECT U.username, R.recipeName FROM Users U NATURAL JOIN Creates C 
    NATURAL JOIN Recipe R WHERE R.recipeID = :recipeID";
    $statement = $db->prepare($user_query);    
    $statement->bindValue(':recipeID', $id);
    $statement->execute();
    $user_result = $statement->fetchColumn();
    $statement->closeCursor();

    // find instructions for recipe
    $instructions_query = "SELECT I.stepNumber, I.step FROM Instruction I NATURAL JOIN Recipe R
    WHERE R.recipeID = :recipeID";
    $statement = $db->prepare($instructions_query);    
    $statement->bindValue(':recipeID', $id);
    $statement->execute();
    $instructions_result = $statement->fetchAll();
    $statement->closeCursor();

    // find ingredients for recipe
    $ingredients_query = "SELECT I.ingredientName, I.cost FROM Ingredient I NATURAL JOIN Recipe R
    WHERE R.recipeID = :recipeID";
    $statement = $db->prepare($ingredients_query);
    $statement->bindValue(':recipeID', $id);
    $statement->execute();
    $ingredients_result = $statement->fetchAll();
    $statement->closeCursor();

    // main query
    $main_query = "SELECT * FROM Recipe NATURAL JOIN Rating WHERE recipeID = :recipeID";
    $statement = $db->prepare($main_query);
    $statement->bindValue(':recipeID', $id);
    $statement->execute();
    $main_result = $statement->fetchAll();
    $statement->closeCursor();

    // find comments for recipe
    $comments_query = "SELECT C.username, C.commentText FROM Comment C NATURAL JOIN Recipe R
    WHERE R.recipeID = :recipeID";
    $statement = $db->prepare($comments_query);
    $statement->bindValue(':recipeID', $id);
    $statement->execute();
    $comments_result = $statement->fetchAll();
    $statement->closeCursor();

    // find image of recipe
    $image_query = "SELECT P.photoURL FROM Photo P NATURAL JOIN Displays D
    NATURAL JOIN Recipe R WHERE R.recipeID = :recipeID";
    $statement = $db->prepare($image_query);
    $statement->bindValue(':recipeID', $id);
    $statement->execute();
    $image_result = $statement->fetchAll();
    $statement->closeCursor();

    // avg rating query
    $avg_query = "SELECT ROUND(AVG(score), 1) AS avg FROM Recipe NATURAL JOIN Rating WHERE recipeID = :recipeID GROUP BY recipeID";
    $statement = $db->prepare($avg_query);
    $statement->bindValue(':recipeID', $id);
    $statement->execute();
    $avg_result = $statement->fetchAll();
    $statement->closeCursor();
}

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
    }
}

?>
<div class="container align-items-center justify-content-center">
    <div class="row justify-content-center">
        <div class="card mt-5" style="width: 1500px;">
            <div class="card-body">
                <h1 class="text-center"><?php echo $main_result[0]['recipeName'] ?></h1>
                <div class="text-center">
                    <?php
                        echo '<img src="' . $image_result[0]['photoURL'] . '" alt="Recipe Image">';
                    ?>
                </div>
                <br>
                <form action="add_favorite.php" method="post">
                    <input type="hidden" name="id" value="<?php echo $_GET['id']; ?>">
                    <input type="hidden" name="username" value="<?php echo $_SESSION['username']; ?>">
                    <button type="submit" class="btn btn-primary">Add Recipe to Favorites</button>
                </form>
                <p><strong>Description:</strong> <?php echo $main_result[0]['descr'] ?></p>
                <p><strong>Cook Time:</strong> <?php echo $main_result[0]['cookTime'] ?> minutes</p>
                <strong>Ingredients:</strong>
                <ul>
                    <?php
                    foreach ($ingredients_result as $row)
                    {
                        ?>
                        <li><?php echo $row['ingredientName']; ?> $<?php echo $row['cost']; ?></li>
                        <?php
                    }
                ?>
                </ul>
                <strong>Instructions:</strong>
                <ol>
                    <?php
                    foreach ($instructions_result as $row)
                    {
                        ?>
                        <li><?php echo $row['step']; ?></li>
                        <?php
                    }
                    ?>
                </ol>
                <p><strong>Created By:</strong> <?php echo $user_result ?></p>
                <p><strong>Rating:</strong> <?php echo $avg_result[0]['avg'] ?>/5</p>
                <form method="post" action="<?php $_SERVER['PHP_SELF'] ?>">
                    <div class="form-row align-items-center">
                        <input type="hidden" name="id" value="<?php echo $_GET['id']; ?>">
                        <input type="hidden" name="username" value="<?php echo 'ashleyrommel'; ?>">
                        <input type="number" name="addRating">/5
                        <input type="submit" value="Add Rating" id="addRBtn" name="addRBtn">
                    </div>
                </form>
                <strong>Comments:</strong><br>
                <?php
                    foreach ($comments_result as $row)
                    {
                        ?>
                        <p><?php echo $row['username']; ?>: <?php echo $row['commentText']; ?></p>
                        <?php
                    }
                ?>
                <form method="post" action="<?php $_SERVER['PHP_SELF'] ?>">
                    <input type="hidden" name="id" value="<?php echo $_GET['id']; ?>">
                    <input type="hidden" name="username" value="<?php echo $_SESSION['username']; ?>">
                    <input type="textarea" name="addComment">
                    <input type="submit" value="Add Comment" id="addCBtn" name="addCBtn"/>
                </form>
                <br>
            </div>
        </div>
    </div>
</div>



<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</body>
</html>