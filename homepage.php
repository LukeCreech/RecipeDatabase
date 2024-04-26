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
</head>
<body>

<table>
    <thead>
        <tr>
            <th><b>Recipe ID</b><th>
            <th><b>Recipe Name</b><th>
            <th><b>Description</b><th>
            <th><b>Cook Time</b><th>
        </tr>
    </thead>
    <?php foreach ($list_of_recipes as $rec_info): ?>
    <tr>
        <td><?php echo $rec_info['recipeID']; ?></td>
        <td><?php echo $rec_info['recipeName']; ?></td>        
        <td><?php echo $rec_info['descr']; ?></td>          
        <td><?php echo $rec_info['cookTime']; ?></td>
    </tr>
    <?php endforeach; ?>  
</table>

</body>
</html>