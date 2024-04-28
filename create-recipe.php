<?php
require ('main-db.php');
require ('navbar.php');

if ($_SERVER['REQUEST_METHOD'] == 'POST')   // GET
{
  if (!empty($_POST['createBtn']))    // $_GET['....']
  {
    $categories = isset($_POST['category']) ? $_POST['category'] : array();
    addRecipe($_POST['recipeName'], $_POST['recipeDescription'], $_POST['cookTime'], $_POST['imageLink'], $_POST['ingredient'], $_POST['cost'], $_POST['instruction'], $categories, $_SESSION['username']);
    
  }
}
?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">   
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
    <title>Create Recipe</title>
</head>
<body>
    <div class="container align-items-center justify-content-center">
    <div class="row justify-content-center">
        <div class="card mt-5" style="width: 1500px;">
            <div class="card-body">
                <h1 class="text-center">Create Recipe</h1>
                <form method="post" action="<?php $_SERVER['PHP_SELF'] ?>" onsubmit="return validateInput()">
    <table>
        <tr>
            <td width="50%">
                <div class='mb-3'>
                    <strong>Name:</strong>
                    <input type='text' class='form-control' id='recipeName' name='recipeName'>
                </div>
            </td>
        </tr>
        <tr>
            <td width="50%">
                <div class='mb-3'>
                    <strong>Description:</strong>
                    <input type='text' class='form-control' id='recipeDescription' name='recipeDescription'>
                </div>
            </td>
        </tr>
        <tr>
            <td width="50%">
                <div class='mb-3'>
                    <strong>Cook Time:</strong>
                    <input type='text' class='form-control' id='cookTime' name='cookTime'>
                </div>
            </td>
        </tr>
        <tr>
            <td width="50%">
                <div class='mb-3'>
                    <strong>Photo URL:</strong>
                    <input type='text' class='form-control' id='imageLink' name='imageLink'>
                </div>
            </td>
        </tr>
    </table>
    <table style="width:98%" id="ingredientTable">
        <tr id="ingredientRow">
            <td width="50%">
                <div class='mb-3'>
                    <strong>Ingredients:</strong>
                    <input type='text' class='form-control' id='ingredient' name='ingredient[]'>
                </div>
            </td>
            <td>
                <div class='mb-3'>
                    <strong>Cost:</strong>
                    <input type='text' class='form-control' id='cost' name='cost[]'>
                </div>
            </td>
        </tr>
    </table>
    <button type="button" onclick="addIngredientRow()">Add Ingredient</button>
    <table style="width:98%" id="instructionTable">
        <tr id="instructionRow">
            <td width="50%">
                <div class='mb-3'>
                    <strong>Instructions:</strong>
                    <input type='text' class='form-control' id='instruction' name='instruction[]'>
                </div>
            </td>
        </tr>
    </table>
    <button type="button" onclick="addInstructionRow()">Add Instruction</button>
    <br></br>
    <fieldset>
        <p><strong>Categories:</strong></p>
        <input type="checkbox" id="lunch" name="category[]" value="lunch">
        <label for="lunch">Lunch</label><br>
        <input type="checkbox" id="salad" name="category[]" value="salad">
        <label for="salad">Salad</label><br>
        <input type="checkbox" id="sides" name="category[]" value="sides">
        <label for="sides">Side Dishes</label><br>
        <input type="checkbox" id="healthy" name="category[]" value="healthy">
        <label for="healthy">Healthy Dishes</label><br>
        <input type="checkbox" id="dinner" name="category[]" value="dinner">
        <label for="dinner">Dinner</label><br>
        <input type="checkbox" id="breakfast" name="category[]" value="breakfast">
        <label for="breakfast">Breakfast</label><br>
        <input type="checkbox" id="dessert" name="category[]" value="dessert">
        <label for="dessert">Desserts</label><br>
    </fieldset>
    <input type="submit" value="Create" id="createBtn" name="createBtn" class="btn btn-dark"/>
    </form>
    </div>
    </div>
    </div>
</div>
</body>
</html>

<script>
    function addIngredientRow() {
        var ingredientTable = document.getElementById("ingredientTable");
        var newRow = ingredientTable.insertRow(-1);
        newRow.innerHTML = document.getElementById("ingredientRow").innerHTML;
    }
    function addInstructionRow() {
        var instructionTable = document.getElementById("instructionTable");
        var newRow = instructionTable.insertRow(-1);
        newRow.innerHTML = document.getElementById("instructionRow").innerHTML;
    }
</script>