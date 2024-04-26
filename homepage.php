<?php
require ("main-db.php");
?>

<?php
session_start();

$loginpage = "user-login.php";

if(session_status() === PHP_SESSION_NONE)
{
    header("Location: " .$loginpage);
    exit;
}

if(!isset($_SESSION["authenticated"]) || $_SESSION["authenticated"] !== true)
{
    header("Location: " .$loginpage);
    exit;
}
$list_of_recipes = getAllRecipes();
?>

<?php
require ('navbar.php');
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


<div class="container align-items-center justify-content-center">
    <div class="row justify-content-center">
        <div class="card mt-5" style="width: 2000px;">
            <div class="card-header">
                <h2 class="display-6 text-center">Budget Recipes</h2>
            </div>
            <div class="card-body">
                <table class="table" style="width: 100%;">
                <thead class="thead-dark">
                    <tr>
                    <th scope="col">Item</th>
                    <th scope="col">Name</th>
                    <th scope="col">Description</th>
                    <th scope="col">Cook Time</th>
                    <th scope="col">Rating</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                        foreach ($list_of_recipes as $row)
                        {
                            ?>
                            <tr>
                            <th scope="row"><?php echo $row['recipeID']; ?></th>
                            <td><?php echo $row['recipeName']; ?></td>
                            <td><?php echo $row['descr']; ?></td>
                            <td><?php echo $row['cookTime']; ?></td>
                            <td><?php echo $row['score']; ?></td>
                            <?php
                        }
                    ?>

                </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</body>
</html>