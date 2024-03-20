-- SQL statements for initializing table

-- User table
CREATE TABLE Users(username VARCHAR(50),
                   pword VARCHAR(50),
                   PRIMARY KEY(username)
);

-- Recipe table
CREATE TABLE Recipe (recipeID INT AUTO_INCREMENT,
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
CREATE TABLE Create (username VARCHAR(50), 
                     recipeID INT,
                     PRIMARY KEY (username, recipeID),
                     FOREIGN KEY (username) REFERENCES Users(username),
                     FOREIGN KEY (recipeID) REFERENCES Recipe(recipeID)
);

-- Category table
CREATE TABLE Category (categoryID INT AUTO_INCREMENT,
                       categoryName VARCHAR(50) NOT NULL,
                       PRIMARY KEY (categoryID)
);

-- Categorized table
CREATE TABLE Categorized (categoryID INT,
                          recipeID INT,
                          PRIMARY KEY (categoryID, recipeID),
                          FOREIGN KEY (categoryID) REFERENCES Category(categoryID),
                          FOREIGN KEY (recipeID) REFERENCES Recipe(recipeID)
);

-- Instruction table
CREATE TABLE Instruction (recipeID INT,
                          stepNumber INT,
                          step TEXT,
                          PRIMARY KEY (recipeID, stepNumber),
                          FOREIGN KEY (recipeID) REFERENCES Recipe(recipeID)
);

-- Ingredient table
CREATE TABLE Ingredient (recipeID INT,
                         ingredientName VARCHAR(50) NOT NULL,
                         cost DECIMAL(10, 2),
                         PRIMARY KEY (recipeID, ingredientName),
                         FOREIGN KEY (recipeID) REFERENCES Recipe(recipeID)
);

-- Photo table
CREATE TABLE Photo (photoID INT AUTO_INCREMENT,
                    photoURL VARCHAR(500) NOT NULL,
                    PRIMARY KEY (photoID)
);

-- Displays table
CREATE TABLE Displays (recipeID INT,
                       photoID INT,
                       PRIMARY KEY (recipeID, photoID),
                       FOREIGN KEY (recipeID) REFERENCES Recipe(recipeID),
                       FOREIGN KEY (photoID) REFERENCES Photo(photoID)
);

-- Comment table
CREATE TABLE Comment (username VARCHAR(50),
                      commentID INT AUTO_INCREMENT,
                      recipeID INT,
                      commentText TEXT,
                      PRIMARY KEY (commentID),
                      FOREIGN KEY (username) REFERENCES Users(username),
                      FOREIGN KEY (recipeID) REFERENCES Recipe(recipeID)
);