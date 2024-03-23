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
VALUES ("https://www.budgetbytes.com/wp-content/uploads/2024/03/Caesar-Salad-Overhead-800x600.jpg")

INSERT INTO Displays (recipeID, photoID)
VALUES (1, 1);

INSERT INTO Comment (username, recipeID, commentText)
VALUES ("lukecreech", 1, "This is a really great and healthy recipe!");
