
CREATE DATABASE IF NOT EXISTS RestaurantDatabase;


USE RestaurantDatabase;


CREATE TABLE IF NOT EXISTS Meals (
                                     MealID INT AUTO_INCREMENT PRIMARY KEY,
                                     Name VARCHAR(255) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    Calories INT NOT NULL
    );


CREATE TABLE IF NOT EXISTS Orders (
                                      OrderID INT AUTO_INCREMENT PRIMARY KEY,
                                      MealID INT NOT NULL,
                                      OrderDate TIMESTAMP NOT NULL,
                                      FOREIGN KEY (MealID) REFERENCES Meals(MealID)
    );


INSERT INTO Meals (Name, Price, Calories) VALUES
                                              ('Spaghetti', 12.99, 450),
                                              ('Salad', 9.99, 250),
                                              ('Steak', 25.99, 800),
                                              ('Pizza', 14.99, 600),
                                              ('Sushi', 19.99, 500);

INSERT INTO Orders (MealID, OrderDate) VALUES
                                           (1, '2023-09-13 12:30:00'),
                                           (2, '2023-09-13 13:45:00'),
                                           (3, '2023-09-13 18:15:00'),
                                           (4, '2023-09-13 19:30:00'),
                                           (5, '2023-09-13 14:00:00');


SELECT Meal, COUNT(*) AS NumberOfOrders
FROM Orders
GROUP BY Meal;


SELECT SUM(Price) AS TotalRevenue
FROM Meals
WHERE Price > 15;


SELECT Meal, COUNT(*) AS NumberOfMeals
FROM Meals
WHERE Calories > 500
GROUP BY Meal;


SELECT SUM(Price) AS TotalPrice
FROM Meals
WHERE LOWER(Name) LIKE '%s%';


SELECT Meal, COUNT(*) AS NumberOfOrders
FROM Orders
WHERE OrderDate < '2023-09-13 18:00:00'
GROUP BY Meal;


SELECT *
FROM Meals
WHERE Price < 20 AND Calories < 700;


SELECT AVG(Price) AS AveragePrice
FROM Meals;
