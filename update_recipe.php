<?php
session_start();
require ('navbar.php');
require ('main-db.php');
?>

<?php

if (isset($_GET['id']))
{
    $id = $_GET['id'];

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

    // find image of recipe
    $image_query = "SELECT P.photoURL FROM Photo P NATURAL JOIN Displays D
    NATURAL JOIN Recipe R WHERE R.recipeID = :recipeID";
    $statement = $db->prepare($image_query);
    $statement->bindValue(':recipeID', $id);
    $statement->execute();
    $image_result = $statement->fetchAll();
    $statement->closeCursor();
}

?>


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">   
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
    <title>Update Recipe</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
    
<div class="container align-items-center justify-content-center">
    <div class="row justify-content-center">
        <div class="card mt-5" style="width: 1500px;">
            <div class="card-body">
                <h1 class="text-center">Edit/Update Recipes</h1>
                <form action=update_recipe_submission.php method="post">
                    <input type="hidden" name="recipe-id" value="<?php echo $id; ?>">
                    <p><strong>Name:</strong> <input type="text" size="30" name="recipe-name" value="<?php echo $main_result[0]['recipeName'] ?>"></p>
                    <p><strong>Cook Time:</strong> <input type="text" size="30" name="cook-time" value="<?php echo $main_result[0]['cookTime'] ?>"></p>
                    <strong>Ingredients:</strong>
                        <?php
                        $index = 0;
                        foreach ($ingredients_result as $row)
                        {
                            ?>
                            <br>
                            <input type="hidden" name="old-ingredient-<?php echo $index ?>" value="<?php echo $row['ingredientName'] ?>">
                            <input type="text" size="30" name="ingredient-<?php echo $index ?>" value="<?php echo $row['ingredientName'] ?>">
                            <input type="text" size="10" name="cost-<?php echo $index ?>" value="<?php echo $row['cost'] ?>">
                            <?php
                            $index++;
                        }
                        ?>
                    <br>
                    <br>
                    <strong>Instructions:</strong>
                    <?php
                        $index = 0;
                        foreach ($instructions_result as $row)
                        {
                            ?>
                            <br>
                            <input type="hidden" name="step-number-<?php echo $index ?>" value="<?php echo $row['stepNumber'] ?>">
                            <textarea name="instruction-<?php echo $index ?>" rows="6" cols="75"><?php echo $row['step'] ?></textarea>
                            <?php
                            $index++;
                        }
                    ?>
                    <br>
                    <br>
                    <p><strong>Photo URL:</strong> <input type="text" size="100" name="photo-url" value="<?php echo $image_result[0]['photoURL'] ?>"></p>
                    <br>
                    <br>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>


</body>
</html>