<?php
require ('navbar.php');
require ("main-db.php");
session_start();
?>

<?php
// find favorites from a given user
$favorites_query = "SELECT recipeName, recipeID FROM Recipe NATURAL JOIN Favorite WHERE username = :username";
$statement = $db->prepare($favorites_query);
$statement->bindValue(':username', $_SESSION['username']);
//$statement->bindValue(':username', 'lukecreech');
$statement->execute();
$favorites_result = $statement->fetchAll();
$statement->closeCursor();
?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">   
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
    <title>Favorite Recipes</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        h3 {
            font-weight: normal;
        }
    </style>
</head>
<body>

<div class="container d-flex justify-content-center align-items-center vh-75">
  <div class="card mt-5" style="width: 2000px;">
    <div class="card-body">
        <h1 class="text-center">Favorites</h1>
            <?php
                foreach ($favorites_result as $row)
                {
                    ?>
                    <h3><a href="recipe-details.php?id=<?php echo $row['recipeID']; ?>"><?php echo $row['recipeName']; ?></a></h3>
                    <a href="remove_favorite.php?id=<?php echo $row['recipeID']; ?>" class="btn btn-danger">Remove</a>
                    <?php
                }
            ?>
        </div>
    </div>
</div>



<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</body>
</html>