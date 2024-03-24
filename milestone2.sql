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

