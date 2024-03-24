-- SQL statements for initializing table

-- User table
CREATE TABLE Users(username VARCHAR(50),
                   pword VARCHAR(50),
                   PRIMARY KEY(username)
);

-- Recipe table
CREATE TABLE Recipe(recipeID INT AUTO_INCREMENT,
                     recipeName VARCHAR(255) NOT NULL,
                     descr TEXT,
                     cookTime INT,
                     PRIMARY KEY (recipeID)
);

-- Rating table
CREATE TABLE Rating(username VARCHAR(50),
                    recipeID INT,
                    score INT,
                    PRIMARY KEY (username, recipeID),
                    FOREIGN KEY (username) REFERENCES Users(username),
                    FOREIGN KEY (recipeID) REFERENCES Recipe(recipeID)
);

-- Favorite table
CREATE TABLE Favorite(recipeID INT,
                      username VARCHAR(50),
                      PRIMARY KEY (recipeID, username),
                      FOREIGN KEY (recipeID) REFERENCES Recipe(recipeID),
                      FOREIGN KEY (username) REFERENCES Users(username)
);

-- Create table
CREATE TABLE Creates(username VARCHAR(50), 
                     recipeID INT,
                     PRIMARY KEY (username, recipeID),
                     FOREIGN KEY (username) REFERENCES Users(username),
                     FOREIGN KEY (recipeID) REFERENCES Recipe(recipeID)
);

-- Category table
CREATE TABLE Category(categoryID INT AUTO_INCREMENT,
                       categoryName VARCHAR(50) NOT NULL,
                       PRIMARY KEY (categoryID)
);

-- Categorized table
CREATE TABLE Categorized(categoryID INT,
                          recipeID INT,
                          PRIMARY KEY (categoryID, recipeID),
                          FOREIGN KEY (categoryID) REFERENCES Category(categoryID),
                          FOREIGN KEY (recipeID) REFERENCES Recipe(recipeID)
);

-- Instruction table
CREATE TABLE Instruction(recipeID INT,
                          stepNumber INT,
                          step TEXT,
                          PRIMARY KEY (recipeID, stepNumber),
                          FOREIGN KEY (recipeID) REFERENCES Recipe(recipeID)
);

-- Ingredient table
CREATE TABLE Ingredient(recipeID INT,
                         ingredientName VARCHAR(50) NOT NULL,
                         cost DECIMAL(10, 2),
                         PRIMARY KEY (recipeID, ingredientName),
                         FOREIGN KEY (recipeID) REFERENCES Recipe(recipeID)
);

-- Photo table
CREATE TABLE Photo(photoID INT AUTO_INCREMENT,
                    photoURL VARCHAR(500) NOT NULL,
                    PRIMARY KEY (photoID)
);

-- Displays table
CREATE TABLE Displays(recipeID INT,
                       photoID INT,
                       PRIMARY KEY (recipeID, photoID),
                       FOREIGN KEY (recipeID) REFERENCES Recipe(recipeID),
                       FOREIGN KEY (photoID) REFERENCES Photo(photoID)
);

-- Comment table
CREATE TABLE Comment(username VARCHAR(50),
                      commentID INT AUTO_INCREMENT,
                      recipeID INT,
                      commentText TEXT,
                      PRIMARY KEY (commentID),
                      FOREIGN KEY (username) REFERENCES Users(username),
                      FOREIGN KEY (recipeID) REFERENCES Recipe(recipeID)
);

-- Set up users
INSERT INTO Users (username, pword)
VALUES ('lukecreech', 'lmc3axn'), 
('nadiaeisa', 'nwe4n'),
('ashleyrommel', 'zwu6su'),
('grantcostello', 'ded5nh');


-- Data entries must fill in Recipe, Creates, Instruction, Ingredient, and Category/Categorized first
-- If the new entry does not apply to any already existing category, you must add a new one

-- Insert Caeser Salad https://www.budgetbytes.com/caesar-salad/
INSERT INTO Recipe (recipeName, descr, cookTime)
VALUES ("Caeser Salad", "This easy Caesar Salad recipe is made with homemade croutons and a rich & flavorful Caesar salad dressing. It’s simple enough to make any day of the week!", 20);

INSERT INTO Creates (username, recipeID)
VALUES ("lukecreech", 1);

INSERT INTO Instruction (recipeID, stepNumber, step)
VALUES (1, 1, "Start by making the Caesar salad dressing. Zest and juice the lemon. You'll need about 3 Tbsp juice and 1 tsp lemon zest. Finely mince the garlic and anchovy filets. Reserve about ½ tsp of the oil from the anchovy container."),
(1, 2, "In a medium bowl add the lemon juice, zest, minced garlic, minced anchovies, anchovy oil, and pepper. Whisk to combine."),
(1, 3, "Add the Dijon mustard, mayonnaise, and grated Parmesan to the bowl and whisk to combine again. Taste the dressing and adjust the ingredients to your liking."),
(1, 4, "Next chop, wash, and dry the Romaine lettuce. Add the lettuce to a large bowl."),
(1, 5, "Top the lettuce with the croutons, shredded Parmesan, and half of the Caesar salad dressing (start with half the dressing and add more as needed). Toss the salad until everything is coated in the dressing. Serve with extra Parmesan cheese and freshly cracked black pepper on top. Enjoy!");

INSERT INTO Ingredient (recipeID, ingredientName, cost)
VALUES (1, "1 fresh lemon", 0.79),
(1, "3 cloves garlic", 0.24),
(1, "3 anchovy filets", 0.86),
(1, "1/4 tsp freshly cracked black pepper", 0.02),
(1, "2 Tbsp Dijon mustard", 0.20),
(1, "1/2 cup mayonnaise", 0.66),
(1, "1/4 cup grated Parmesan", 0.40),
(1, "8 cups chopped romaine lettuce", 3.73),
(1, "2 cups croutons", 0.71),
(1, "1/2 cup shredded Parmesan", 0.89);

INSERT INTO Category (categoryName)
VALUES ("Lunch"),
("Salad"),
("Side Dishes"),
("Healthy Options");

INSERT INTO Categorized (categoryID, recipeID)
VALUES (1, 1),
(2, 1),
(3, 1),
(4, 1);

INSERT INTO Rating (username, recipeID, score)
VALUES ("lukecreech", 1, 4);

INSERT INTO Favorite (recipeID, username)
VALUES (1, "lukecreech");

INSERT INTO Photo (photoURL)
VALUES ("https://www.budgetbytes.com/wp-content/uploads/2024/03/Caesar-Salad-Overhead-800x600.jpg");

INSERT INTO Displays (recipeID, photoID)
VALUES (1, 1);

INSERT INTO Comment (username, recipeID, commentText)
VALUES ("lukecreech", 1, "This is a really great and healthy recipe!");


-- Insert Mac and Cheese https://www.budgetbytes.com/extra-cheesy-homemade-mac-and-cheese/
INSERT INTO Recipe (recipeName, descr, cookTime)
VALUES ("Mac and Cheese", "This incredibly creamy and cheesy homemade mac and cheese is great on its own or as a jumping off point for your own creation.", 25);

INSERT INTO Creates (username, recipeID)
VALUES ("lukecreech", 2);

INSERT INTO Instruction (recipeID, stepNumber, step)
VALUES (2, 1, "Cook the macaroni according to the package directions (boil for 7-8 minutes, or until tender). Drain the macaroni in a colander."),
(2, 2, "Place the butter, flour, and onion powder in a medium pot. Whisk and heat over medium until the butter is melted and the mixture begins to bubble. Once bubbling, continue to whisk and cook for one minute."),
(2, 3, "After cooking the butter and flour roux, whisk in the milk. Continue to cook and whisk over medium heat until the milk begins to gently simmer, at which point it will thicken to the consistency of heavy cream or gravy."),
(2, 4, "Turn the burner off. Season the white sauce with the salt and hot sauce."),
(2, 5, "Begin to add the shredded cheddar, one handful at a time, whisking it in until completely melted before adding more. Continue until all of the cheese has been melted into the sauce. If the sauce becomes too cold to melt the cheese, place it back over low heat only briefly to continue melting the cheese. Overheating the sauce can cause it to break and become grainy."),
(2, 6, "Add the cooked and drained pasta to the pot with the cheese sauce and stir to combine. Serve the mac and cheese hot and enjoy!");

INSERT INTO Ingredient (recipeID, ingredientName, cost)
VALUES (2, "8 oz. macaroni", 0.67),
(2, "3 Tbsp butter", 0.30),
(2, "3 Tbsp all-purpose flour", 0.03),
(2, "1/2 tsp onion powder", 0.05),
(2, "2 cups whole milk", 0.84),
(2, "1/2 tsp hot sauce", 0.02),
(2, "1/2 tsp salt ", 0.03),
(2, "8 oz. block sharp cheddar, shredded", 2.25);

INSERT INTO Categorized (categoryID, recipeID)
VALUES (1, 2),
(3, 2);

INSERT INTO Rating (username, recipeID, score)
VALUES ("lukecreech", 2, 4.6);

INSERT INTO Favorite (recipeID, username)
VALUES (2, "lukecreech");

INSERT INTO Photo (photoURL)
VALUES ("https://www.budgetbytes.com/wp-content/uploads/2021/12/Homemade-Mac-and-Cheese-above-800x533.jpg");

INSERT INTO Displays (recipeID, photoID)
VALUES (2, 2);

INSERT INTO Comment (username, recipeID, commentText)
VALUES ("lukecreech", 2, "Love this Mac and Cheese, it is so cheap!");

-- Insert PARMESAN RISOTTO https://www.budgetbytes.com/parmesan-risotto/
INSERT INTO Recipe (recipeName, descr, cookTime)
VALUES ("Parmesan Risotto", "Creamy Parmesan risotto is comfort food at its finest! Warm, rich, and cheesy, this dish is a perennial favorite.", 40);

INSERT INTO Creates (username, recipeID)
VALUES ("lukecreech", 3);

INSERT INTO Instruction (recipeID, stepNumber, step)
VALUES (3, 1, "Bring the vegetable broth to a simmer in a large saucepan. Keep warm over low heat."),
(3, 2, "Heat a large deep sauté pan over medium-high heat. Add oil to the pan. Swirl to coat and add your onion and salt. Cook for 5 minutes, stirring occasionally until onions look glossy and clear. Your onions should not caramelize or brown for this recipe."),
(3, 3, "Add the Arborio rice to the pan and stir to combine. Toast the onion and rice together for about 1 minute, stirring constantly."),
(3, 4, "Deglaze your pan with room temperature white wine and let it cook down until there’s just a little left in the pan, about ½ or less of what you poured in."),
(3, 5, "Now, begin adding 1 ladle of hot broth at a time, stirring the risotto constantly until the broth is about 75% absorbed by the arborio rice. I find it usually takes a solid minute or two before I add another ladle of broth. Add another ladle until your entire supply of hot stock has been used up. This step takes approximately 20 minutes total. Once you have used up all of your broth and your Arborio rice is al dente and creamy, remove pot from heat."),
(3, 6, "Stir in butter, pepper, and cheese. Taste and adjust salt, if needed, and finish with the parsley.");

INSERT INTO Ingredient (recipeID, ingredientName, cost)
VALUES (3, "4 1/2 cups vegetable broth", 0.36),
(3, "2 Tbsp extra-virgin olive oil", 0.34),
(3, "1 small yellow onion, diced small", 0.78),
(3, "1/4 tsp salt", 0.02),
(3, "1 1/2 cups Arborio rice, uncooked and unrinsed", 2.62),
(3, "1/2 cup dry white wine or vegetable broth", 1.04),
(3, "1 Tbsp butter", 0.13),
(3, "1/2 tsp freshly cracked black pepper", 0.03),
(3, "1/2 cup grated Parmesan", 2.57),
(3, "1 Tbsp minced fresh parsley", 0.08);

INSERT INTO Category (categoryName)
VALUES ("Dinner"); -- category ID 5

INSERT INTO Categorized (categoryID, recipeID)
VALUES (5, 3);

INSERT INTO Rating (username, recipeID, score)
VALUES ("lukecreech", 2, 3.9);

INSERT INTO Photo (photoURL)
VALUES ("https://www.budgetbytes.com/wp-content/uploads/2024/03/Parmesan-Risotto-Plated-768x576.jpg");

INSERT INTO Displays (recipeID, photoID)
VALUES (3, 3);

INSERT INTO Comment (username, recipeID, commentText)
VALUES ("lukecreech", 3, "This is a very unique dish! It really surpised me");

-- Insert Soft Boiled Eggs https://www.budgetbytes.com/make-soft-boiled-eggs/
INSERT INTO Recipe (recipeName, descr, cookTime)
VALUES ("Soft Boiled Eggs", "Perfect soft boiled eggs with firm whites and liquid gold centers are only six minutes away. Use this easy step by step guide for perfect eggs every time.", 10);

INSERT INTO Creates (username, recipeID)
VALUES ("nadiaeisa", 5);

INSERT INTO Instruction (recipeID, stepNumber, step)
VALUES (5, 1, "Add 1 inch of water to a sauce pot, cover, and bring to a boil over high heat."),
(5, 2, "Once boiling, add an egg (or however many you’d like as long as they are in a single layer in the bottom of the pot), straight from the refrigerator into the pot. Replace the lid and let it continue to boil for exactly six minutes."),
(5, 3, "After six minutes, remove the egg(s) from the pot and place them in an ice water bath or run under cool water until they are cool enough to handle. Peel, and enjoy!");

INSERT INTO Ingredient (recipeID, ingredientName, cost)
VALUES (5, "1 large egg, chilled", 0.41);

INSERT INTO Category (categoryName)
VALUES ("Breakfast"); -- categoryID 6 

INSERT INTO Categorized (categoryID, recipeID)
VALUES
(6, 5);

INSERT INTO Rating (username, recipeID, score)
VALUES ("nadiaeisa", 5, 1);

INSERT INTO Photo (photoURL)
VALUES ("https://www.budgetbytes.com/wp-content/uploads/2018/09/Perfect-Soft-Boiled-Eggs-Blue-500x500.jpg")

INSERT INTO Displays (recipeID, photoID)
VALUES (5, 4);

INSERT INTO Comment (username, recipeID, commentText)
VALUES ("nadiaeisa", 4, "Not a fan of eggs.");

-- Insert Fluffy Homemade Pancakes https://www.budgetbytes.com/homemade-pancakes/
INSERT INTO Recipe (recipeName, descr, cookTime)
VALUES ("Fluffy Homemade Pancakes", "This easy homemade pancake recipe makes the most delicious and fluffy stack of pancakes around! Perfect for a cozy weekend breakfast.", 30);

INSERT INTO Creates (username, recipeID)
VALUES ("grantcostello", 16);

INSERT INTO Instruction (recipeID, stepNumber, step)
VALUES (16, 1, "Whisk together the flour, baking powder, and salt in a bowl."),
(16, 2, "In a separate bowl, whisk together the milk, egg, melted butter, sugar, and vanilla extract."),
(16, 3, "Pour the bowl of wet ingredients into the bowl of dry ingredients and stir just until combined. DO NOT overmix. The mixture should be thick, but still pourable, and a little bit lumpy. If it's not pourable, add an additional tablespoon or two of milk until it is thick, but pourable. Let the batter rest for 15 minutes."),
(16, 4, "Heat a large skillet or griddle over medium. Once hot add enough cooking oil to coat the surface (I use about ½ tsp per pancake). Add the pancake batter to the hot griddle, ¼ cup at a time. Use the back of the measuring cup to spread the batter into a 4.5-inch diameter circle."),
(16, 5, "Cook the pancakes until bubbles form over the surface and begin to pop, the edges of the pancakes look dry, and the bottom is golden brown (about 60 seconds). Flip the pancakes and cook on the second side until golden brown (about 30 seconds)."),
(16, 6, "Repeat with the remaining batter, adding more oil to the skillet between batches or as needed, until all of the pancakes have been cooked. Keep the pancakes warm on a plate under a towel or in a warm oven until all of the pancakes have been cooked. Serve warm with your favorite toppings!");

INSERT INTO Ingredient (recipeID, ingredientName, cost)
VALUES (16, "1 cup all-purpose flour", 0.07),
VALUES (16, "1.5 tsp baking powder", 0.03),
VALUES (16, "1/2 tsp salt", 0.03),
VALUES (16, "3/4 cup warm milk", 0.02),
VALUES (16, "2 Tbsp melted butter", 0.20),
VALUES (16, "1 large egg", 0.21),
VALUES (16, "2 Tbsp sugar", 0.02),
VALUES (16, "1/2 tsp vanilla extract", 0.14),
VALUES (16, "4 tsp cooking oil", 0.05);

INSERT INTO Categorized (categoryID, recipeID)
VALUES
(6, 16);

INSERT INTO Rating (username, recipeID, score)
VALUES ("grantcostello", 16, 5);

INSERT INTO Photo (photoURL)
VALUES ("https://www.budgetbytes.com/wp-content/uploads/2022/04/Homemade-Pancakes-fork-side-500x500.jpg")

INSERT INTO Displays (recipeID, photoID)
VALUES (16, 16);

INSERT INTO Comment (username, recipeID, commentText)
VALUES ("grantcostello", 16, "Yummy!!!!! :)");

-- Insert 5 Ingredient Freezer Biscuits https://www.budgetbytes.com/5-ingredient-freezer-biscuits/
INSERT INTO Recipe (recipeName, descr, cookTime)
VALUES ("5 Ingredient Freezer Biscuits", "5 Ingredient Freezer Biscuits are the fastest and easiest way to have fresh, warm, and fluffy biscuits for breakfast any day of the week.", 32);

INSERT INTO Creates (username, recipeID)
VALUES ("grantcostello", 17);

INSERT INTO Instruction (recipeID, stepNumber, step)
VALUES (17, 1, "In a large bowl, stir together the flour, salt, sugar, and baking powder until well combined."),
(17, 2, "Pour in the heavy cream and stir until a sticky ball of dough forms. Sprinkle the dough generously with flour and then turn the dough out onto a floured surface. Gently knead the dough 2-3 times, or just until the dough feels mixed and has enough flour that it is no longer sticky. Avoid over working the dough."),
(17, 3, "Gently pat the dough down into a 6×8 rectangle, then fold it in half. Repeat this two more times. Folding the dough in this manner helps create layers within the biscuits."),
(17, 4, "After folding, pat the dough down into a 6×8 rectangle one final time. The dough should be about one inch thick. Cut the dough into 12 squares."),
(17, 5, "Line a baking sheet with parchment, then place the cut biscuits on the parchment, separated just slightly. Cover with plastic wrap and freeze the biscuits for a couple of hours, or just until solid. Label and date a gallon-sized freezer bag. Place the frozen biscuits in the bag for long term storage (3-4 months)."),
(17, 6, "To bake the biscuits, place any number of biscuits you want on a baking sheet lined with parchment. Let the biscuits thaw only as long as it takes to preheat the oven to 400ºF. Once the oven is preheated, bake the biscuits until puffed up tall and deep golden brown on top. Depending on your oven and size of the biscuits, it should take about 18-22 minutes (frozen), or 16-20 minutes (fresh).");

INSERT INTO Ingredient (recipeID, ingredientName, cost)
VALUES (17, "2.5 cups all-purpose flour (plus some for dusting)", 0.26),
VALUES (17, "1 tsp salt", 0.05),
VALUES (17, "1 Tbsp sugar", 0.02),
VALUES (17, "4 tsp baking powder", 0.16),
VALUES (17, "1 pint heavy whipping cream", 3.65);

INSERT INTO Categorized (categoryID, recipeID)
VALUES
(6, 17),
(3, 17);

INSERT INTO Rating (username, recipeID, score)
VALUES ("grantcostello", 17, 2);

INSERT INTO Photo (photoURL)
VALUES ("https://www.budgetbytes.com/wp-content/uploads/2016/10/Freezer-Biscuits-brush-butter-1-500x500.jpg");

INSERT INTO Displays (recipeID, photoID)
VALUES (17, 17);

INSERT INTO Comment (username, recipeID, commentText)
VALUES ("grantcostello", 17, "You should cut them into circles");

-- Insert Lemon Garlic Roasted Chicken https://www.budgetbytes.com/lemon-garlic-roasted-chicken/
INSERT INTO Recipe (recipeName, descr, cookTime)
VALUES ("Lemon Garlic Roasted Chicken", "This low and slow cooking method makes this Lemon Garlic Roasted Chicken incredibly tender, juicy, and flavorful!", 130);

INSERT INTO Creates (username, recipeID)
VALUES ("grantcostello", 18);

INSERT INTO Instruction (recipeID, stepNumber, step)
VALUES (18, 1, "Preheat the oven to 275ºF. Squeeze about 3 Tbsp lemon juice from the lemon(s) and slice the remainder. Mince two cloves of the garlic, and peel the remaining 4. In a small bowl, whisk together the lemon juice, olive oil, minced garlic, salt, and pepper."),
(18, 2, "Pat the chicken breasts dry with a paper towel. Place them in a glass or ceramic casserole dish. Pour the prepared lemon marinade over the chicken, using a spoon to redistribute the marinade and make sure the surface of the chicken is fully covered. Add the remaining cloves of peeled garlic and sliced lemon around the chicken. If you’re sensitive to bitter flavors, add the additional lemon slices after baking. Cover the dish tightly with foil."),
(18, 3, "Roast the chicken in the preheated oven for 90 minutes. After 90 minutes, turn the oven up to 425ºF, remove the foil, and baste the chicken with the juices from the bottom of the dish. Return the chicken to the oven and roast for an additional 20 minutes without foil at 425ºF, or until the skin is golden brown and crispy."),
(18, 4, "Let the chicken rest for 5-10 minutes before slicing. Serve warm with the pan drippings spooned over top.");

INSERT INTO Ingredient (recipeID, ingredientName, cost)
VALUES (18, "2 small or 1 large lemon", 0.30),
VALUES (18, "1/3 cup olive oil", 0.78),
VALUES (18, "6 cloves garlic", 0.48),
VALUES (18, "1/4 tsp salt", 0.02),
VALUES (18, "Freshly cracked pepper", 0.05),
VALUES (18, "2 lbs split chicken breasts", 4.77);

INSERT INTO Categorized (categoryID, recipeID)
VALUES
(5, 18);

INSERT INTO Rating (username, recipeID, score)
VALUES ("grantcostello", 18, 3);

INSERT INTO Photo (photoURL)
VALUES ("https://www.budgetbytes.com/wp-content/uploads/2017/03/Drizzle-Juice-500x500.jpg");

INSERT INTO Displays (recipeID, photoID)
VALUES (18, 18);

INSERT INTO Comment (username, recipeID, commentText)
VALUES ("grantcostello", 18, "Mmmmmm very tender and juicy");

-- Insert Chocolate Mousse https://www.budgetbytes.com/chocolate-mousse/
INSERT INTO Recipe (recipeName, descr, cookTime)
VALUES ("Chocolate Mousse", "When it comes to a perfectly luscious and light dessert, it doesn't get much simpler than this deeply flavored easy chocolate mousse. You are four ingredients away from heaven!", 75);

INSERT INTO Creates (username, recipeID)
VALUES ("grantcostello", 19);

INSERT INTO Instruction (recipeID, stepNumber, step)
VALUES (19, 1, "Fill a pot halfway with water and bring it to a boil. Take it off the heat. Place the chocolate in a bowl and place the bowl in the hot water, being careful not to get any water in the bowl. Leave the bowl there until the chocolate melts."),
(19, 2, "Add the heavy cream to a large mixing bowl and beat on medium speed until soft peaks form."),
(19, 3, "In a separate large mixing bowl, whip the egg whites on medium speed to soft peaks. Add the sugar and continue beating until stiff peaks form."),
(19, 4, "Gently fold the egg whites into the chocolate in thirds. Fold until no white streaks remain."),
(19, 5, "Gently fold the whipped cream into the chocolate in thirds. There should be no white streaks."),
(19, 6, "Scoop mousse into serving dishes, cover, and refrigerate for an hour. Garnish with sweetened whipped cream, raspberries, mint, or shaved chocolate.");

INSERT INTO Ingredient (recipeID, ingredientName, cost)
VALUES (19, "8 oz dark or semi-sweet chocolate", 2.90),
VALUES (19, "1 pint heavy whipping cream, very cold", 3.29),
VALUES (19, "3 egg whites, room temperature", 1.25),
VALUES (19, "1/2 cup powdered sugar or sugar substitute", 0.13);

INSERT INTO Categorized (categoryID, recipeID)
VALUES
(7, 19);

INSERT INTO Rating (username, recipeID, score)
VALUES ("grantcostello", 19, 5);

INSERT INTO Photo (photoURL)
VALUES ("https://www.budgetbytes.com/wp-content/uploads/2023/02/ChocolateMoussespoonRE-800x600.jpg");

INSERT INTO Displays (recipeID, photoID)
VALUES (19, 19);

INSERT INTO Comment (username, recipeID, commentText)
VALUES ("grantcostello", 19, "Woah");

-- Insert Vanilla Pudding https://www.budgetbytes.com/vanilla-pudding/
INSERT INTO Recipe (recipeName, descr, cookTime)
VALUES ("Vanilla Pudding", "This homemade vanilla pudding recipe is super rich and creamy, only takes a few simple ingredients, and is so much better than instant mixes!", 20);

INSERT INTO Creates (username, recipeID)
VALUES ("grantcostello", 20);

INSERT INTO Instruction (recipeID, stepNumber, step)
VALUES (20, 1, "Add the sugar and cornstarch to a medium-sized pot. Mix them together and set the pot over medium heat."),
(20, 2, "Add the milk and stir constantly until it comes to a boil. Continue stirring for 1 minute longer."),
(20, 3, "The milk should be thick enough to coat the back of wooden spoon. Take the mixture off the heat."),
(20, 4, "Beat the egg yolks. Whisk one tablespoon of the hot milk into the beaten egg yolks."),
(20, 5, "Continue to whisk in the milk, tablespoon by tablespoon, until the egg mixture is very warm."),
(20, 6, "Set the remaining pot of milk over medium heat and whisk in the warmed egg mixture. Bring the pudding to a boil while stirring constantly. Continue stirring for 1 minute longer."),
(20, 7, "Take the pudding off the heat. Add the vanilla and the butter. Stir until the butter has melted."),
(20, 8, "Strain the pudding through a fine mesh sieve."),
(20, 9, "Add the strained pudding to a large bowl. Serve warm or cover with plastic film touching the pudding's surface and store in the refrigerator until the pudding has cooled.");

INSERT INTO Ingredient (recipeID, ingredientName, cost)
VALUES (20, "1/2 cup sugar", 0.12),
VALUES (20, "3 Tbsp corn starch", 0.09),
VALUES (20, "3 cups whole milk", 0.73),
VALUES (20, "3 large egg yolk", 0.60),
VALUES (20, "1.5 tsp vanilla extract", 0.87),
VALUES (20, "3 Tbsp salted butter", 0.38);

INSERT INTO Categorized (categoryID, recipeID)
VALUES
(7, 20);

INSERT INTO Rating (username, recipeID, score)
VALUES ("grantcostello", 20, 5);

INSERT INTO Photo (photoURL)
VALUES ("https://www.budgetbytes.com/wp-content/uploads/2022/08/Vanilla-Pudding-above-500x500.jpg");

INSERT INTO Displays (recipeID, photoID)
VALUES (20, 20);

INSERT INTO Comment (username, recipeID, commentText)
VALUES ("grantcostello", 20, "Yay Puddin'");
VALUES ("nadiaeisa", 5, "Not a fan of eggs.");

-- Insert Sesame Chicken https://www.budgetbytes.com/easy-sesame-chicken/
INSERT INTO Recipe (recipeName, descr, cookTime)
VALUES ("Sesame Chicken", "This Easy Sesame Chicken recipe is faster and tastier than takeout. Tender chicken coated in a homemade sweet, savory, and tangy sauce.", 25);

INSERT INTO Creates (username, recipeID)
VALUES ("nadiaeisa", 6);

INSERT INTO Instruction (recipeID, stepNumber, step)
VALUES (6, 1, "First, prepare the sauce. In a small bowl stir together the soy sauce, water, sesame oil, brown sugar, rice vinegar, fresh ginger, minced garlic, cornstarch, and sesame seeds. (Grate the ginger with a small-holed cheese grater). Set the sauce aside."),
(6, 2, "In a large bowl, whisk together the egg, 2 Tbsp cornstarch, and a pinch of salt and pepper. Trim any excess fat from the chicken thighs, then cut them into small 1 inch pieces. Toss the chicken in the egg and cornstarch mixture."),
(6, 3, "Add the cooking oil to a large skillet and heat it over medium flame. Wait until the skillet is very hot, then swirl the skillet to make sure the oil coats the entire surface. Add the batter coated chicken and spread it out into a single layer over the surface of the skillet."),
(6, 4, "Allow the chicken pieces to cook, undisturbed, until golden brown on the bottom. Then, carefully flip the chicken, breaking up the pieces into smaller clumps as you flip. Continue to cook the chicken until golden brown on the other side. Stir the chicken as little as possible to avoid breaking the egg coating from the surface of the chicken."),
(6, 5, "Once the chicken is cooked through and golden brown on all sides, pour the sauce over top. Toss the chicken to coat in the sauce. As the sauce comes up to a simmer, it will begin to thicken. Continue to gently stir the chicken in the sauce until it has thickened, then turn off the heat."),
(6, 6, "Serve the chicken over a bed of rice and sprinkle the sliced green onions over top.");

INSERT INTO Ingredient (recipeID, ingredientName, cost)
VALUES (6, "1 large egg", 0.23),
(6, "2 1/2 Tbsp cornstarch", 0.06),
(6, "1 pinch each salt and pepper", 0.05),
(6, "1 lb boneless skinless chicken thighs", 3.23),
(6, "2 Tbsp cooking oil", 0.08),
(6, "1/4 cup soy sauce", 0.24),
(6, "2 Tbsp water ", 0.00),
(6, "1 Tbsp toasted sesame oil ", 0.33),
(6, "3 Tbsp brown sugar", 0.12),
(6, "1 Tbsp rice vinegar", 0.12),
(6, "1 tsp grated fresh ginger", 0.10),
(6, "2 cloves garlic, minced", 0.16),
(6, "1 Tbsp sesame seeds", 0.80),
(6, "4 cups cooked jasmine rice", 0.70),
(6, "2 whole green onions", 0.22);

INSERT INTO Categorized (categoryID, recipeID)
VALUES (5, 6);

INSERT INTO Rating (username, recipeID, score)
VALUES ("nadiaeisa", 6, 3);

INSERT INTO Photo (photoURL)
VALUES ("https://www.budgetbytes.com/wp-content/uploads/2018/07/Easy-Sesame-Chicken-finished-1200-500x500.jpg")

INSERT INTO Displays (recipeID, photoID)
VALUES (6, 5);

INSERT INTO Comment (username, recipeID, commentText)
VALUES ("nadiaeisa", 6, "I'm more of a general tso's girl, but still pretty good");

-- Insert Pea Salad https://www.budgetbytes.com/pea-salad/
INSERT INTO Recipe (recipeName, descr, cookTime)
VALUES ("Pea Salad", "Super simple and inexpensive, this creamy pea salad is the perfect side dish for your next family get-together.", 10);

INSERT INTO Creates (username, recipeID)
VALUES ("nadiaeisa", 7);

INSERT INTO Instruction (recipeID, stepNumber, step)
VALUES (7, 1, "Rinse the frozen peas in cool water. Strain and leave out at room temperature. Meanwhile, cut the ham into small dice cubes and prep the red onion, cheddar cheese, and parsley."),
(7, 2, "n a small mixing bowl, whisk together Greek yogurt, mayonnaise, white vinegar, minced parsley, and salt and pepper."),
(7, 3, "Toss all ingredients together in a large bowl. Serve immediately or enjoy all week!");

INSERT INTO Ingredient (recipeID, ingredientName, cost)
VALUES (7, "4 cups frozen peas", 2.28),
(7, "2 cups cubed ham steak", 3.99),
(7, "1/2 small red onion, diced small", 0.22),
(7, "8 oz. cheddar cheese, cubed small", 2.49),
(7, "1 Tbsp minced parsley", 0.05),
(7, "1/3 cup plain Greek yogurt", 0.32),
(7, "1 Tbsp mayonnaise", 0.07),
(7, "1 Tbsp white vinega", 0.02),
(7, "1 tsp salt", 0.05),
(7, "1 tsp freshly cracked black pepper", 0.05);

INSERT INTO Categorized (categoryID, recipeID)
VALUES (2, 7),
(3, 7),
(4, 7);

INSERT INTO Rating (username, recipeID, score)
VALUES ("nadiaeisa", 7, 2);

INSERT INTO Photo (photoURL)
VALUES ("https://www.budgetbytes.com/wp-content/uploads/2024/03/Pea-Salad-Spoon-500x500.jpg")

INSERT INTO Displays (recipeID, photoID)
VALUES (7, 6);

INSERT INTO Comment (username, recipeID, commentText)
VALUES ("nadiaeisa", 7, "A little untraditional, but surprisingly decent");

-- Insert Creamy Cajun Chicken Pasta https://www.budgetbytes.com/one-pot-creamy-cajun-chicken-pasta/
INSERT INTO Recipe (recipeName, descr, cookTime)
VALUES ("Creamy Cajun Chicken Pasta", "Cook a complete dinner in one pot with this Creamy Cajun Chicken Pasta, using mostly pantry-stable items. Perfect for busy weeknights!", 30);

INSERT INTO Creates (username, recipeID)
VALUES ("nadiaeisa", 8);

INSERT INTO Instruction (recipeID, stepNumber, step)
VALUES (8, 1, "Combine the ingredients for the Cajun seasoning in a small bowl. Cut the chicken into 1/2 to 3/4-inch cubes. Place the cubed chicken in a bowl, pour the Cajun seasoning over top, and stir to coat the chicken in spices."),
(8, 2, "Add the olive oil and butter to a large deep skillet. Heat the oil and butter over medium-high until the skillet is very hot and the butter is melted and foamy. Add the seasoned chicken to the skillet and cook for a couple minutes on each side, or just until the outside gets some color. The chicken does not need to be cooked through at this point."),
(8, 3, "Add the diced yellow onion to the skillet and continue to sauté for about 2 minutes more, or just until the onion begins to soften. Allow the moisture from the onion to dissolve any browned bits from the bottom of the skillet."),
(8, 4, "Next, add the pasta, fire roasted diced tomatoes (with the juices), and chicken broth to the skillet. Stir just until everything is evenly combined, then place a lid on top and allow the broth to come up to a boil."),
(8, 5, "Once boiling, turn the heat down to medium-low and let the pasta simmer for about ten minutes, stirring every couple of minutes, until the pasta is tender and the liquid is thick and saucy."),
(8, 4, "Add the cream cheese to the skillet in chunks, then stir until it has melted into the sauce. Top the pasta with sliced green onions and serve.");

INSERT INTO Ingredient (recipeID, ingredientName, cost)
VALUES (8 "2 tsp smoked paprika", 0.20),
(8, "1 tsp oregano", 0.10),
(8, "1 tsp thyme", 0.10),
(8, "1/2 tsp garlic powder", 0.05),
(8, "1/2 tsp onion powder", 0.05),
(8, "1/4 tsp cayenne pepper", 0.03),
(8, "1/4 tsp black pepper", 0.02),
(8, "1/4 tsp salt", 0.02),
(8, "1 Tbsp olive oil", 0.16),
(8, "1 Tbsp butter", 0.13),
(8, "1 lb. boneless, skinless chicken breast", 5.47),
(8, "1 yellow onion, diced", 0.32),
(8, "1/2 lb. penne pasta (uncooked)", 0.75),
(8, "15 oz. fire roasted diced tomatoes", 1.00),
(8, "2 cups chicken broth", 0.26),
(8, "2 oz. cream cheese", 0.50),
(8, "3 green onions, sliced", 0.25),;

INSERT INTO Categorized (categoryID, recipeID)
VALUES (5, 8);

INSERT INTO Rating (username, recipeID, score)
VALUES ("nadiaeisa", 8, 5);

INSERT INTO Favorite (recipeID, username)
VALUES (1, "nadiaeisa");

INSERT INTO Photo (photoURL)
VALUES ("https://www.budgetbytes.com/wp-content/uploads/2018/10/One-Pot-Creamy-Cajun-Chicken-Pasta-pan-500x500.jpg");

INSERT INTO Displays (recipeID, photoID)
VALUES (8, 7);

INSERT INTO Comment (username, recipeID, commentText)
VALUES ("nadiaeisa", 8, "This combined all my favorite things! Def recommend!!");

-- Insert Oatmeal Raisin Cookies https://www.budgetbytes.com/oatmeal-cookies/
INSERT INTO Recipe (recipeName, descr, cookTime)
VALUES ("Oatmeal Raisin Cookies", "These delicious Oatmeal Cookies are crispy around the edges and soft & chewy in the center. The perfect way to satisfy your sweet tooth!", 28);

INSERT INTO Creates (username, recipeID)
VALUES ("nadiaeisa", 9);

INSERT INTO Instruction (recipeID, stepNumber, step)
VALUES (9, 1, "Preheat the oven to 350°F. In a large mixing bowl, add the softened butter, white sugar, and brown sugar. Blend the ingredients together with a hand mixer until smooth."),
(9, 2, "Add the egg and vanilla extract to the bowl and blend with the sugar mixture until smooth."),
(9, 3, "Next in a separate bowl, whisk together the dry ingredients (flour, salt, baking soda, and cinnamon) until well combined. Add the rolled oats to the dry ingredients and mix until combined."),
(9, 4, "Add all of the dry ingredients to the same bowl as the sugar mixture. Blend the ingredients together with a hand mixer on low speed until just combined. Do not overmix."),
(9, 5, "Next add the raisins to the bowl and fold them into the cookie dough with a spatula."),
(9, 6, "Using a medium cookie scoop or your hands, scoop the cookie dough into roughly 2 Tbsp portions then roll into a ball. Place the cookies on a parchment lined baking sheet about 2-3 inches apart. You'll likely need to cook the cookies in two batches, so keep the remaining dough chilled until ready to roll and bake."),,
(9, 7, "Bake the cookies for 13-14 minutes or until lightly golden brown. The center of the cookies may look too soft when you remove them from the oven, but keep in mind the cookies will continue to set as they cool. Let the cookies cool slightly on the baking sheet before transferring to a wire rack to cool completely. Enjoy!");

INSERT INTO Ingredient (recipeID, ingredientName, cost)
VALUES (9, "10 Tbsp salted butter, softened ", 1.33),
(9, "1/2 cup granulated white sugar", 0.17),
(9, "1/2 cup brown sugar", 0.27),
(9, "1 egg", 0.14),
(9, "1 tsp vanilla extract", 0.25),
(9, "1 cup all-purpose flour", 0.20),
(9, "1/2 tsp salt", 0.02),
(9, "1/2 tsp baking soda", 0.02),
(9, "1/2 tsp cinnamon", 0.05),
(9, "1 1/2 cups old-fashioned rolled oats", 0.39),
(9, "3/4 cup raisins", 0.93);

INSERT INTO Category (categoryName)
VALUES ("Desserts"); -- categoryID 7

INSERT INTO Categorized (categoryID, recipeID)
VALUES (7, 9);

INSERT INTO Rating (username, recipeID, score)
VALUES ("nadiaeisa", 9, 5);

INSERT INTO Favorite (recipeID, username)
VALUES (1, "nadiaeisa");

INSERT INTO Photo (photoURL)
VALUES ("https://www.budgetbytes.com/wp-content/uploads/2024/01/Oatmeal-Cookies-Plated-500x500.jpg");

INSERT INTO Displays (recipeID, photoID)
VALUES (9, 8);

INSERT INTO Comment (username, recipeID, commentText)
VALUES ("nadiaeisa", 9, "I LOVE oatmeal raisin cookies! This recipe is saving me so much money and time by showing me how to do it myself!");

-- Insert Chicken Nuggets https://www.budgetbytes.com/air-fryer-chicken-nuggets/
INSERT INTO Recipe (recipeName, descr, cookTime)
VALUES ("Chicken Nuggets", "These Air Fryer Chicken Nuggets are tender, juicy, easy to make, and perfect with your favorite dipping sauce!", 23);

INSERT INTO Creates (username, recipeID)
VALUES ("lukecreech", 10);

INSERT INTO Instruction (recipeID, stepNumber, step)
VALUES (10, 1, "On a cutting board, cut the chicken breast into 3/4 inch pieces. You should get approximately 20-24 chicken nuggets depending on the size of your chicken breast."),
(10, 2, "Sprinkle ¼ tsp of salt evenly over the chicken pieces. Next sprinkle the flour over the chicken and toss to coat evenly."),
(10, 3, "In a small bowl add the breadcrumbs, garlic powder, smoked paprika, and ½ tsp salt. Mix seasoning into the breadcrumbs. Next add the cooking oil to the breadcrumbs and stir until the oil is evenly coating the breadcrumbs. It should look like damp sand."),
(10, 4, "In another small bowl add ½ cup buttermilk."),
(10, 5, "Now line up the chicken, buttermilk, and breadcrumbs. Using tongs or your hands, begin to coat the chicken nugget pieces by first dipping them in the buttermilk, then transfer them to the breadcrumbs and coat them evenly with the breadcrumbs. Set the coated chicken pieces to the side."),
(10, 6, "Preheat the air fryer to 400°F. Once preheated, place the chicken nuggets in the air fryer basket in a single layer. Try not to overcrowd the basket. You can cook the chicken nuggets in 2 batches if needed. Air fry for 8 minutes, flipping the nuggets halfway through."),,
(10, 7, "Remove chicken nuggets from the air fryer and let cool for 3-5 minutes, then serve with your favorite dipping sauce.");

INSERT INTO Ingredient (recipeID, ingredientName, cost)
VALUES (10, "1 boneless, skinless chicken breast (about 2/3 lb.)", 3.50),
(10, "3/4 tsp salt, divided", 0.05),
(10, "1 Tbsp all-purpose flour", 0.02),
(10, "1/2 cup buttermilk", 0.24),
(10, "1 cup plain breadcrumbs", 0.60),
(10, "1 tsp garlic powder", 0.10),
(10, "1/2 tsp smoked paprika", 0.05),
(10, "2 Tbsp cooking oil", 0.08);

INSERT INTO Categorized (categoryID, recipeID)
VALUES (1, 10),
(5, 10);

INSERT INTO Rating (username, recipeID, score)
VALUES ("lukecreech", 10, 5);

INSERT INTO Favorite (recipeID, username)
VALUES (10, "lukecreech");

INSERT INTO Photo (photoURL)
VALUES ("https://www.budgetbytes.com/wp-content/uploads/2023/08/Air-Fryer-Chicken-Nuggets-close-500x500.jpg");

INSERT INTO Displays (recipeID, photoID)
VALUES (10, 9);

INSERT INTO Comment (username, recipeID, commentText)
VALUES ("lukecreech", 10, "Chicken nuggets are one of my favorite foods and this was so easy to make!");

-- Insert Garlic Noodles https://www.budgetbytes.com/garlic-noodles/

INSERT INTO Recipe (recipeName, descr, cookTime)
VALUES ("Garlic Noodles", "Garlic Noodles are sweet, rich, and savory with a strong garlic punch. They make the perfect side dish to any Asian inspired meal.", 25);

INSERT INTO Creates (username, recipeID)
VALUES ("lukecreech", 11);

INSERT INTO Instruction (recipeID, stepNumber, step)
VALUES (11, 1, "Add the oyster sauce, brown sugar, soy sauce and sesame oil to a bowl and stir until combined."),
(11, 2, "Bring a large pot of water to a boil and cook the noodles according to the package directions (boil for 7-10 minutes). Drain the cooked noodles in a colander, then set aside."),
(11, 3, "While the pasta cooks, mince the garlic and slice the green onions. Melt the butter in a large skillet over medium-low heat. Once the butter is melted and bubbly, add the garlic and onions (save a few for garnish) and sauté until they are soft and fragrant (1-2 minutes)."),
(11, 4, "Remove the skillet from the heat. Add the drained pasta and oyster sauce mixture to the skillet, and stir well to coat the pasta. If your pasta is stiff or sticky making it hard to stir, sprinkle a small amount of hot water over the pasta to loosen it up. Garnish the pasta with any reserved sliced green onions, then serve.");

INSERT INTO Ingredient (recipeID, ingredientName, cost)
VALUES (11, "8 oz angel hair pasta", 0.54),
(11, "4 cloves garlic", 0.24),
(11, "1/2 bunch green onions", 035),
(11, "4 Tbsp butter ", 0.50),
(11, "2 tsp soy sauce", 0.20),
(11, "2 Tbsp brown sugar", 0.05),
(11, "1 tsp sesame oil ", 0.40),
(11, "2 Tbsp oyster sauce", 0.26);

INSERT INTO Categorized (categoryID, recipeID)
VALUES (1, 11),
(5, 11);

INSERT INTO Rating (username, recipeID, score)
VALUES ("lukecreech", 10, 4.2);

INSERT INTO Photo (photoURL)
VALUES ("https://www.budgetbytes.com/wp-content/uploads/2009/12/Garlic-Noodles-front.jpg");

INSERT INTO Displays (recipeID, photoID)
VALUES (11, 10);

INSERT INTO Comment (username, recipeID, commentText)
VALUES ("lukecreech", 11, "Great recipe that I added to my rotation, I had never tried this before.");
