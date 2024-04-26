<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">   
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
    <title>Recipe Database</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
    
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="collapse navbar-collapse" id="main-navbar">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="homepage.php">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="create-recipe.php">Create Recipe</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="favorites.php">Favorites</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="main-navbar-dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Categories
                </a>
                <div class="dropdown-menu" aria-labelledby="main-navbar-dropdown">
                <a class="dropdown-item" href="dinner.php">Dinner</a>
                <a class="dropdown-item" href="lunch.php">Lunch</a>
                <a class="dropdown-item" href="breakfast.php">Breakfast</a>
                <a class="dropdown-item" href="sides.php">Sides</a>
                <a class="dropdown-item" href="dessert.php">Dessert</a>
                <a class="dropdown-item" href="healthy.php">Healthy</a>
                </div>
            </li>
        </ul>
        <form class="form-inline my-2 my-log-0">
                <button class="btn btn-outline-danger" type="button" onclick="window.location.href='logout.php'">Logout</button>
        </form>
    </div>
</nav>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</body>
</html>

<!--
    <div>
        <ul>
            <li><a href="create-recipe.php">Create Recipe</a></li>
            <li><a href="favorites.php">Favorite Recipes</a></li>
            <li><a href="user-login.php">Login</a></li>
        </ul>
    </div>
    <div>
        <ul>
            <li><a href="dinner.php">Dinner</a></li>
            <li><a href="lunch.php">Lunch</a></li>
            <li><a href="breakfast.php">Breakfast</a></li>
            <li><a href="sides.php">Sides</a></li>
            <li><a href="desserts.php">Dessert</a></li>
            <li><a href="healthy.php">Healthy</a></li>
        </ul>
    </div>

    <h1><a href="homepage.php">Recipe App</a></h1>
    <form>
        <input type="text" name="Search..." required /> <br/>
        <input type="submit" value="Search" class="btn" />
    </form>

-->