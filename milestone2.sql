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
VALUES ("nadiaeisa", 4);

INSERT INTO Instruction (recipeID, stepNumber, step)
VALUES (4, 1, "Add 1 inch of water to a sauce pot, cover, and bring to a boil over high heat."),
(4, 2, "Once boiling, add an egg (or however many you’d like as long as they are in a single layer in the bottom of the pot), straight from the refrigerator into the pot. Replace the lid and let it continue to boil for exactly six minutes."),
(4, 3, "After six minutes, remove the egg(s) from the pot and place them in an ice water bath or run under cool water until they are cool enough to handle. Peel, and enjoy!");

INSERT INTO Ingredient (recipeID, ingredientName, cost)
VALUES (4, "1 large egg, chilled", 0.41);

INSERT INTO Category (categoryName)
VALUES ("Breakfast"); -- categoryID 6 

INSERT INTO Categorized (categoryID, recipeID)
VALUES
(6, 4);

INSERT INTO Rating (username, recipeID, score)
VALUES ("nadiaeisa", 4, 1);

INSERT INTO Photo (photoURL)
VALUES ("https://www.budgetbytes.com/wp-content/uploads/2018/09/Perfect-Soft-Boiled-Eggs-Blue-500x500.jpg")

INSERT INTO Displays (recipeID, photoID)
VALUES (4, 4);

INSERT INTO Comment (username, recipeID, commentText)
VALUES ("nadiaeisa", 4, "Not a fan of eggs.");

-- Insert Healthy French Toast https://beatthebudget.com/recipe/cinnamon-french-toast-with-mixed-berries/
INSERT INTO Recipe (recipeName, descr, cookTime)
VALUES ("Healthy French Toast", "This healthy French toast is infused with cinnamon and whipped up in 15 minutes and topped juicy berries.", 15);

INSERT INTO Creates (username, recipeID)
VALUES ("ashleyrommel", 11);

INSERT INTO Instruction (recipeID, stepNumber, step)
VALUES (11, 1, "If possible, leave the slices of bread on a baking tray, uncovered, overnight to dry out before cooking."),
(11, 2, "Set the frozen mixed berries aside to defrost. Combine the eggs, skimmed milk, vanilla extract, honey and cinnamon in a bowl with a whisk."),
(11, 3, "Add a ½ a tbsp of olive oil into a large non-stick frying pan on a medium heat. One by one, dunk the stale pieces of bread into skimmed milk/egg mix and transfer into the frying pan, frying 2 pieces at a time."),
(11, 4, "After around 3 minutes, or until golden brown, rotate and repeat the frying process on the other side. Transfer to the oven whilst completing dunking/frying the rest of the pieces of bread. For each two pieces of bread, use around ½ a tbsp of olive oil for frying."),
(11, 5, "Serve the french toast with a dollop of Greek yogurt, a handful of mixed berries, a squeeze of honey and an extra sprinkle of cinnamon.");

INSERT INTO Ingredient (recipeID, ingredientName, cost)
VALUES (11, "100 g frozen mixed berries", 1.09),
(11, "3 eggs", 0.47),
(11, "1/2 cup skimmed milk", 0.65),
(11, "8 thick slices of whole wheat bread", 0.63),
(11, "4 tbsp 0% fat Greek yogurt", 0.92),
(11, "2 tbsp honey", 0.38),
(11, "1 tsp cinnamon ", 0.08),
(11, "2 tbsp olive oil", 0.79);
(11, "1 tsp vanilla extract", 0.17);

INSERT INTO Categorized (categoryID, recipeID)
VALUES (4, 11),
(6, 11);

INSERT INTO Rating (username, recipeID, score)
VALUES ("ashleyrommel", 11, 4.8);

INSERT INTO Photo (photoURL)
VALUES ("https://beatthebudget.com/wp-content/uploads/2022/03/Healthy-French-Toast-with-Cinnamon-Photo-1-1200-px-by-1800-px.jpg");

INSERT INTO Displays (recipeID, photoID)
VALUES (11, 11);

INSERT INTO Comment (username, recipeID, commentText)
VALUES ("ashleyrommel", 11, "This is a fun and easy breakfast that is different than pancakes!");

-- Insert Chocolate Chip Cookies https://www.budgetbytes.com/chocolate-chip-cookies/
INSERT INTO Recipe (recipeName, descr, cookTime)
VALUES ("Chocolate Chip Cookies", "This easy chocolate chip cookie recipe makes deliciously chewy cookies with crispy edges and melty semi-sweet chocolate chips throughout.", 45);

INSERT INTO Creates (username, recipeID)
VALUES ("ashleyrommel", 12);

INSERT INTO Instruction (recipeID, stepNumber, step)
VALUES (12, 1, "Melt the butter over medium heat in a light-colored pan, stirring often, until the solids separate and turn golden brown and you can smell a nutty aroma. Place the brown butter in a large bowl and transfer it to the refrigerator or freezer until it hardens."),
(12, 2, "Once the butter has hardened, break it into pieces, and add the white and brown sugar to the bowl. Use a hand mixer to cream the butter and the sugars on low speed until incorporated."),
(12, 3, "Add the vanilla extract and one egg to the bowl. Mix on low speed until incorporated. Scrape down the sides of the bowl and add the second egg. Mix on low speed until combined, scraping down the sides of the bowl as needed."),
(12, 4, "In a separate bowl, combine the all-purpose flour and baking soda."),
(12, 5, "Pour half of the flour mixture into the creamed butter mixture and mix on low speed until combined. Scrape down the sides of the bowl, add in the remaining flour, and mix on low speed until a dough forms. Fold in the chocolate chips until evenly combined."),
(12, 6, "Divide and roll the dough into balls about 2 Tbsp in size. Place the dough balls on a sheet pan lined with parchment paper about two inches apart. Chill the dough in your refrigerator, uncovered, for at least an hour, but preferably overnight."),
(12, 7, "When ready to bake, preheat the oven to 350°F. Press the chilled cookie dough balls down with two fingers to flatten slightly."),
(12, 8, "Bake the cookies for 4 minutes, rotate the sheet pan front to back, then bake for an additional 4 minutes, or until the edges are a light golden brown. Let the cookies cool on the sheet pan for at least 5 minutes before transferring to a cooling rack to finish cooling.");


INSERT INTO Ingredient (recipeID, ingredientName, cost)
VALUES (12, "12 Tbsp salted butter", 1.50),
(12, "1/2 cup brown sugar", 0.22),
(12, "1/4 cup granulated white sugar", 0.08),
(12, "1 tsp vanilla extract", 0.57),
(12, "2 large eggs", 0.42),
(12, "1 1/2 cups all-purpose flour", 0.18),
(12, "1/2 tsp baking soda", 0.03),
(12, "1 cup semi-sweet chocolate chips", 1.58);

INSERT INTO Category(categoryName)
VALUES ("Dessert");

INSERT INTO Categorized (categoryID, recipeID)
VALUES (7, 12);

INSERT INTO Rating (username, recipeID, score)
VALUES ("ashleyrommel", 12, 5);

INSERT INTO Favorite (recipeID, username)
VALUES (12, "ashleyrommel");

INSERT INTO Photo (photoURL)
VALUES ("https://www.budgetbytes.com/wp-content/uploads/2022/12/Chocolate-Chip-Cookies-side-2-800x600.jpg");

INSERT INTO Displays (recipeID, photoID)
VALUES (12, 12);

INSERT INTO Comment (username, recipeID, commentText)
VALUES ("ashleyrommel", 12, "This is the perfect chocolate chip cookie recipe!");

-- Insert PESTO CHICKEN AND BROCCOLI SALAD https://www.budgetbytes.com/pesto-chicken-and-broccoli-salad/
INSERT INTO Recipe (recipeName, descr, cookTime)
VALUES ("PESTO CHICKEN AND BROCCOLI SALAD", "Chicken, broccoli, onion, and a creamy pesto dressing make this quick salad a delicious new lunchtime staple!", 15);

INSERT INTO Creates (username, recipeID)
VALUES ("ashleyrommel", 13);

INSERT INTO Instruction (recipeID, stepNumber, step)
VALUES (13, 1, "Chop the chicken and broccoli into small, bite-sized pieces. Finely dice the red onion."),
(13, 2, "In a bowl, stir together the pesto, mayonnaise, and lemon juice."),
(13, 3, "Add the chicken, broccoli, and red onion to a large bowl. Pour the creamy pesto over top, and add the freshly cracked pepper. Stir to combine."),
(13, 4, "Taste the salad and add salt or pepper to your liking. Serve immediately or refrigerate until ready to eat.");

INSERT INTO Ingredient (recipeID, ingredientName, cost)
VALUES (13, "1 cup chopped cooked chicken", 3.50),
(13, "1 lb. fresh broccoli (about 2 cups chopped)", 1.25),
(13, "1/4 cup chopped red onion", 0.08),
(13, "1/4 cup basil pesto", 1.00),
(13, "1/4 cup mayonnaise", 0.29),
(13, "1 Tbsp lemon juice", 0.04),
(13, "1/4 tsp freshly cracked black pepper", 0.02);

INSERT INTO Categorized (categoryID, recipeID)
VALUES (1, 13);

INSERT INTO Rating (username, recipeID, score)
VALUES ("ashleyrommel", 13, 5);

INSERT INTO Favorite (recipeID, username)
VALUES (13, "ashleyrommel");

INSERT INTO Photo (photoURL)
VALUES ("https://www.budgetbytes.com/wp-content/uploads/2022/05/Pesto-Chicken-Broccoli-Salad-V2-800x1067.jpg");

INSERT INTO Displays (recipeID, photoID)
VALUES (13, 13);

INSERT INTO Comment (username, recipeID, commentText)
VALUES ("ashleyrommel", 13, "This is such an easy and yummy lunch!");

-- Insert CHILI ROASTED SWEET POTATOES https://budgetbytes.com/chili-roasted-sweet-potatoes/
INSERT INTO Recipe (recipeName, descr, cookTime)
VALUES ("CHILI ROASTED SWEET POTATOES", "Chili Roasted Sweet Potatoes are an easy and flavorful side dish for any southwest inspired meal. Perfect for busy weeknights and meal prep!", 55);

INSERT INTO Creates (username, recipeID)
VALUES ("ashleyrommel", 14);

INSERT INTO Instruction (recipeID, stepNumber, step)
VALUES (14, 1, "Preheat the oven to 400ºF. Line a baking sheet with aluminum foil."),
(14, 2, "Wash and peel the sweet potatoes, then cut them into 1/2 inch cubes. Place the cubed sweet potatoes into a large bowl and drizzle with the olive oil, chili powder, and salt. Toss the potatoes until evenly coated in oil and spices."),
(14, 3, "Spread the seasoned sweet potatoes out over the prepared baking sheet so they are in a single layer. Roast the potatoes in the preheated oven for 45 minutes, stirring once half way through. After 45 minutes, the sweet potatoes should be soft and slightly browned on the edges. Total cooking time will ultimately depend on the size of your cubes.");

INSERT INTO Ingredient (recipeID, ingredientName, cost)
VALUES (14, "2 lbs. sweet potatoes", 2.08),
(14, "1 Tbsp chili powder", 0.30),
(14, "2 Tbsp olive oil", 0.24),
(14, "1/4 tsp salt (or to taste)", 0.02);

INSERT INTO Categorized (categoryID, recipeID)
VALUES (3, 14),
(4, 14);

INSERT INTO Rating (username, recipeID, score)
VALUES ("ashleyrommel", 14, 3.5);

INSERT INTO Photo (photoURL)
VALUES ("https://www.budgetbytes.com/wp-content/uploads/2016/02/Chili-Roasted-Sweet-Potatoes-2-368x276.jpg");

INSERT INTO Displays (recipeID, photoID)
VALUES (14, 14);

INSERT INTO Comment (username, recipeID, commentText)
VALUES ("ashleyrommel", 14, "If you like spicy you'll like this!");

-- Insert ROASTED BROCCOLI PASTA WITH LEMON AND FETA https://www.budgetbytes.com/roasted-broccoli-pasta-with-lemon-and-feta/
INSERT INTO Recipe (recipeName, descr, cookTime)
VALUES ("ROASTED BROCCOLI PASTA WITH LEMON AND FETA", "Roasted Broccoli Pasta with Lemon and Feta is an incredibly simple pasta dish with big flavors. An easy, fast, and delicious weeknight dinner!", 40);

INSERT INTO Creates (username, recipeID)
VALUES ("ashleyrommel", 15);

INSERT INTO Instruction (recipeID, stepNumber, step)
VALUES (15, 1, "Preheat the oven to 400ºF. Cut the broccoli into small florets. Line a baking sheet with parchment paper, then spread the florets out over the baking sheet. Drizzle the broccoli with olive oil and sprinkle the steak seasoning over top. Toss the broccoli until it is well coated in oil and seasoning."),
(15, 2, "Roast the broccoli for 20-25 minutes, or until it is brown and crispy on the edges."),
(15, 3, "While the broccoli is roasting, prepare the rest of the dish. Bring a pot of water to boil for the penne. Once boiling, add the pasta, and continue to boil until the pasta is tender (8-10 minutes). Reserve about ½ cup of the starchy pasta water, then drain the pasta in a colander."),
(15, 4, "While the pasta is boiling, zest a lemon, then cut it into wedges.")
(15, 5, "Return the drained pasta to the pot (heat turned off). Add the roasted broccoli florets, the butter, about 1 tsp lemon zest, and the juice from two of the lemon wedges. Stir the ingredients together, letting the residual heat from the pasta melt the butter. If the pasta seems too dry, add a splash or two of the reserved pasta water.")
(15, 6, "Top the pasta with crumbled feta and a pinch or two more steak seasoning, if desired. Serve with extra lemon wedges.");

INSERT INTO Ingredient (recipeID, ingredientName, cost)
VALUES (15, "1 lb. broccoli crowns", 1.79),
(15, "1 Tbsp olive oil", 0.16),
(15, "1 tsp steak seasoning", 0.10),
(15, "1 fresh lemon", 0.39),
(15, "8 oz. whole wheat penne pasta", 0.50),
(15, "2 Tbsp butter", 0.20),
(15, "1 oz. crumbled feta", 0.55);

INSERT INTO Categorized (categoryID, recipeID)
VALUES (1, 15),
(5, 15);

INSERT INTO Rating (username, recipeID, score)
VALUES ("ashleyrommel", 15, 4.7);

INSERT INTO Favorite (recipeID, username)
VALUES (15, "ashleyrommel");

INSERT INTO Photo (photoURL)
VALUES ("https://www.budgetbytes.com/wp-content/uploads/2020/01/Roasted-Broccoli-Pasta-with-Lemon-and-Feat-bowl-V2.jpg");

INSERT INTO Displays (recipeID, photoID)
VALUES (15, 15);

INSERT INTO Comment (username, recipeID, commentText)
VALUES ("ashleyrommel", 15, "Good way to add vegetables to a pasta dish!");