PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS users;

CREATE TABLE users(
    username TEXT NOT NULL,
    pw TEXT NOT NULL,
    firstName TEXT NOT NULL,
    lastName TEXT NOT NULL,
    address_ TEXT NOT NULL,
    city TEXT NOT NULL,
    country TEXT NOT NULL,
    postalCode TEXT NOT NULL,
    email TEXT NOT NULL,
    phone TEXT NOT NULL,
    PRIMARY KEY(username)
);

DROP TABLE IF EXISTS items;

CREATE TABLE items(
    id INTEGER,
    ownerUser TEXT NOT NULL,
    category TEXT NOT NULL,
    descriptionItem TEXT NOT NULL,
    sizeItem TEXT NOT NULL,
    color TEXT NOT NULL,
    price INTEGER NOT NULL,
    brand TEXT NOT NULL,
    model TEXT NOT NULL,
    condition TEXT NOT NULL,
    imagePath TEXT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (ownerUser) REFERENCES users(username)
);

DROP TABLE IF EXISTS sizes;

CREATE TABLE sizes(
    sizeText TEXT NOT NULL,
    PRIMARY KEY (sizeText)
);

DROP TABLE IF EXISTS categories;

CREATE TABLE categories(
    category TEXT NOT NULL,
    PRIMARY KEY (category)
);

DROP TABLE IF EXISTS conditions;

CREATE TABLE conditions(
    condition TEXT NOT NULL,
    PRIMARY KEY (condition)
);

DROP TABLE IF EXISTS buy;

CREATE TABLE buy(
    id INTEGER,
    user TEXT NOT NULL,
    PRIMARY KEY (id, user),
    FOREIGN KEY (id) REFERENCES items(id),
    FOREIGN KEY (user) REFERENCES users(username)
);

DROP TABLE IF EXISTS sold;

CREATE TABLE sold(
    id INTEGER,
    user TEXT NOT NULL,
    PRIMARY KEY (id, user),
    FOREIGN KEY (id) REFERENCES items(id),
    FOREIGN KEY (user) REFERENCES users(username)
);

DROP TABLE IF EXISTS wishlist;

CREATE TABLE wishlist(
    id INTEGER,
    user TEXT NOT NULL,
    PRIMARY KEY (id, user),
    FOREIGN KEY (id) REFERENCES items(id),
    FOREIGN KEY (user) REFERENCES users(username)
);

DROP TABLE IF EXISTS comment;

CREATE TABLE comment(
    id INTEGER NOT NULL,
    idItem INTEGER NOT NULL,
    user TEXT NOT NULL,
    texto TEXT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (idItem) REFERENCES items(id),
    FOREIGN KEY (user) REFERENCES users(username)
);

DROP TABLE IF EXISTS reply;

CREATE TABLE reply(
    id INTEGER NOT NULL,
    idComment INTEGER NOT NULL,
    user TEXT NOT NULL,
    texto TEXT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (idComment) REFERENCES comment(id),
    FOREIGN KEY (user) REFERENCES users(username)
);

DROP TABLE IF EXISTS adminUser;

CREATE TABLE adminUser(
    username TEXT NOT NULL,
    PRIMARY KEY (username),
    FOREIGN KEY (username) REFERENCES users(username)
);

DROP TABLE IF EXISTS review;

CREATE TABLE review(
    idItem INTEGER NOT NULL,
    username TEXT NOT NULL,
    rating TEXT NOT NULL,
    texto TEXT NOT NULL,
    PRIMARY KEY (idItem, username),
    FOREIGN KEY (idItem) REFERENCES items(id),
    FOREIGN KEY (username) REFERENCES users(username)
);

INSERT INTO users VALUES ('jgmesquita', 'pw', 'Jorge', 'Mesquita', 'adress', 'city', 'country', 'postalCode', 'email', 'phone');
INSERT INTO users VALUES ('user1', 'pw', 'Jorge', 'Mesquita', 'adress', 'city', 'country', 'postalCode', 'email', 'phone');
INSERT INTO users VALUES ('tati', '12345678', 'Tatiana', 'Lin', 'adress', 'city', 'country', 'postalCode', 'email', 'phone');
INSERT INTO users VALUES ('T', '87654321', 'Tatiana', 'Lin', 'adress', 'city', 'country', 'postalCode', 'email', 'phone');

INSERT INTO adminUser VALUES ('jgmesquita');
INSERT INTO adminUser VALUES ('tati');

INSERT INTO sizes VALUES ('XS');
INSERT INTO sizes VALUES ('S');
INSERT INTO sizes VALUES ('M');
INSERT INTO sizes VALUES ('L');
INSERT INTO sizes VALUES ('N/A');



INSERT INTO categories VALUES ('ELECTRONICS-Mobile Phones');
INSERT INTO categories VALUES ('ELECTRONICS-Laptops and Computers');
INSERT INTO categories VALUES ('ELECTRONICS-Cameras');
INSERT INTO categories VALUES ('ELECTRONICS-Home Appliances');
INSERT INTO categories VALUES ('ELECTRONICS-Audio and Video Equipment');

INSERT INTO categories VALUES ('FASHION-Clothing');
INSERT INTO categories VALUES ('FASHION-Footwear');
INSERT INTO categories VALUES ('FASHION-Accessories');

INSERT INTO categories VALUES ('HOME-Furniture');
INSERT INTO categories VALUES ('HOME-Home Decor');
INSERT INTO categories VALUES ('HOME-Kitchenware');
INSERT INTO categories VALUES ('HOME-Bedding and Bath');
INSERT INTO categories VALUES ('HOME-Gardening Supplies');

INSERT INTO categories VALUES ('HEALTH-Skincare');
INSERT INTO categories VALUES ('HEALTH-Haircare');
INSERT INTO categories VALUES ('HEALTH-Makeup');
INSERT INTO categories VALUES ('HEALTH-Health Supplements');
INSERT INTO categories VALUES ('HEALTH-Personal Care');

INSERT INTO categories VALUES ('SPORTS-Exercise Equipment');
INSERT INTO categories VALUES ('SPORTS-Outdoor Gear');
INSERT INTO categories VALUES ('SPORTS-Sports Apparel');
INSERT INTO categories VALUES ('SPORTS-Bicycles and Scooters');
INSERT INTO categories VALUES ('SPORTS-Camping Equipment');

INSERT INTO categories VALUES ('TOYS-Action Figures');
INSERT INTO categories VALUES ('TOYS-Puzzles and Board Games');
INSERT INTO categories VALUES ('TOYS-Arts and Crafts');
INSERT INTO categories VALUES ('TOYS-Collectibles');
INSERT INTO categories VALUES ('TOYS-Model Kits');

INSERT INTO categories VALUES ('AUTOMOTIVE-Car Accessories');
INSERT INTO categories VALUES ('AUTOMOTIVE-Motorcycle Gear');
INSERT INTO categories VALUES ('AUTOMOTIVE-Tools and Equipment');
INSERT INTO categories VALUES ('AUTOMOTIVE-Tires and Wheels');
INSERT INTO categories VALUES ('AUTOMOTIVE-Car Care Products');

INSERT INTO categories VALUES ('BOOKS-Books');
INSERT INTO categories VALUES ('BOOKS-Magazines');
INSERT INTO categories VALUES ('BOOKS-Music');
INSERT INTO categories VALUES ('BOOKS-Movies and TV Shows');
INSERT INTO categories VALUES ('BOOKS-Video Games');

INSERT INTO categories VALUES ('FOOD-Groceries');
INSERT INTO categories VALUES ('FOOD-Gourmet Food');
INSERT INTO categories VALUES ('FOOD-Beverages');
INSERT INTO categories VALUES ('FOOD-Snacks');
INSERT INTO categories VALUES ('FOOD-Organic and Health Foods');

INSERT INTO categories VALUES ('OFFICE-Stationery');
INSERT INTO categories VALUES ('OFFICE-Office Furniture');
INSERT INTO categories VALUES ('OFFICE-Printers and Scanners');
INSERT INTO categories VALUES ('OFFICE-Office Electronics');
INSERT INTO categories VALUES ('OFFICE-Writing Instruments');

INSERT INTO categories VALUES ('PETS-Pet Food');
INSERT INTO categories VALUES ('PETS-Pet Toys');
INSERT INTO categories VALUES ('PETS-Pet Grooming');
INSERT INTO categories VALUES ('PETS-Pet Accessories');
INSERT INTO categories VALUES ('PETS-Aquariums and Pet Habitat');

INSERT INTO categories VALUES ('BABY-Baby Gear');
INSERT INTO categories VALUES ('BABY-Nursery Furniture');
INSERT INTO categories VALUES ('BABY-Baby Clothing');
INSERT INTO categories VALUES ('BABY-Toys for Babies and Kids');
INSERT INTO categories VALUES ('BABY-Baby Care Products');

INSERT INTO categories VALUES ('JEWELRY-Fine Jewelry');
INSERT INTO categories VALUES ('JEWELRY-Fashion Jewelry');
INSERT INTO categories VALUES ('JEWELRY-Watches');
INSERT INTO categories VALUES ('JEWELRY-Engagement and Wedding');
INSERT INTO categories VALUES ('JEWELRY-Accessories');

INSERT INTO categories VALUES ('TRAVEL-Luggage and Suitcases');
INSERT INTO categories VALUES ('TRAVEL-Travel Accessories');
INSERT INTO categories VALUES ('TRAVEL-Backpacks');
INSERT INTO categories VALUES ('TRAVEL-Travel Gadgets');
INSERT INTO categories VALUES ('TRAVEL-Travel Clothing');

INSERT INTO categories VALUES ('TOOLS-Hand Tools');
INSERT INTO categories VALUES ('TOOLS-Power Tools');
INSERT INTO categories VALUES ('TOOLS-Building Materials');
INSERT INTO categories VALUES ('TOOLS-Home Improvement');
INSERT INTO categories VALUES ('TOOLS-Hardware');

INSERT INTO categories VALUES ('MUSIC-Guitars and Basses');
INSERT INTO categories VALUES ('MUSIC-Keyboards and Pianos');
INSERT INTO categories VALUES ('MUSIC-Drums and Percussion');
INSERT INTO categories VALUES ('MUSIC-String Instruments');
INSERT INTO categories VALUES ('MUSIC-Wind Instruments');

INSERT INTO categories VALUES ('OTHER');


INSERT INTO conditions VALUES ('Pouco Usado');
INSERT INTO conditions VALUES ('Muito Usado');
INSERT INTO conditions VALUES ('Com Defeito');
INSERT INTO conditions VALUES ('Novo');

--ITEMS--
-- Electronics
INSERT INTO items VALUES (1, 'tati', 'ELECTRONICS-Mobile Phones', 'Smartphone', 'M', 'black', 900, 'Apple', '12 Pro', 'new', '/images/C.png');
INSERT INTO items VALUES (2, 'tati', 'ELECTRONICS-Laptops and Computers', 'Laptop', '15-inch', 'silver', 1000, 'BrandY', 'ModelB', 'new', '/images/D.png');
INSERT INTO items VALUES (3, 'tati', 'ELECTRONICS-Cameras', 'DSLR Camera', 'N/A', 'black', 500, 'BrandZ', 'ModelC', 'new', '/images/E.png');

-- Fashion
INSERT INTO items VALUES (4, 'tati', 'FASHION-Clothing', 'T-shirt', 'L', 'red', 20, 'BrandA', 'ModelD', 'new', '/images/B.png');
INSERT INTO items VALUES (5, 'tati', 'FASHION-Footwear', 'Sneakers', '42', 'white', 60, 'BrandB', 'ModelE', 'new', '/images/B.png');
INSERT INTO items VALUES (6, 'tati', 'FASHION-Accessories', 'Watch', 'N/A', 'black', 150, 'BrandC', 'ModelF', 'new', '/images/B.png');

-- Home
INSERT INTO items VALUES (7, 'tati', 'HOME-Furniture', 'Sofa', '3-seater', 'grey', 400, 'BrandD', 'ModelG', 'new', '/images/B.png');
INSERT INTO items VALUES (8, 'tati', 'HOME-Home Decor', 'Wall Art', 'N/A', 'multicolor', 80, 'BrandE', 'ModelH', 'new', '/images/A.png');
INSERT INTO items VALUES (9, 'tati', 'HOME-Kitchenware', 'Cookware Set', '10-piece', 'stainless steel', 200, 'BrandF', 'ModelI', 'new', '/images/B.png');

-- Health
INSERT INTO items VALUES (10, 'tati', 'HEALTH-Skincare', 'Moisturizer', '50ml', 'N/A', 30, 'BrandG', 'ModelJ', 'new', '/images/B.png');
INSERT INTO items VALUES (11, 'tati', 'HEALTH-Haircare', 'Shampoo', '250ml', 'N/A', 15, 'BrandH', 'ModelK', 'new', '/images/A.png');
INSERT INTO items VALUES (12, 'tati', 'HEALTH-Makeup', 'Lipstick', 'N/A', 'red', 20, 'BrandI', 'ModelL', 'new', '/images/A.png');

-- Sports
INSERT INTO items VALUES (13, 'tati', 'SPORTS-Exercise Equipment', 'Treadmill', 'N/A', 'black', 800, 'BrandJ', 'ModelM', 'new', '/images/A.png');
INSERT INTO items VALUES (14, 'tati', 'SPORTS-Outdoor Gear', 'Tent', '4-person', 'green', 100, 'BrandK', 'ModelN', 'new', '/images/A.png');
INSERT INTO items VALUES (15, 'tati', 'SPORTS-Sports Apparel', 'Running Shorts', 'M', 'blue', 25, 'BrandL', 'ModelO', 'new', '/images/A.png');

-- Toys
INSERT INTO items VALUES (16, 'tati', 'TOYS-Action Figures', 'Superhero Figure', 'N/A', 'multicolor', 30, 'BrandM', 'ModelP', 'new', '/images/B.png');
INSERT INTO items VALUES (17, 'tati', 'TOYS-Puzzles and Board Games', 'Puzzle', '1000 pieces', 'multicolor', 20, 'BrandN', 'ModelQ', 'new', '/images/B.png');
INSERT INTO items VALUES (18, 'tati', 'TOYS-Arts and Crafts', 'Paint Set', 'N/A', 'multicolor', 15, 'BrandO', 'ModelR', 'new', '/images/B.png');

-- Automotive
INSERT INTO items VALUES (19, 'tati', 'AUTOMOTIVE-Car Accessories', 'Car Cover', 'N/A', 'grey', 50, 'BrandP', 'ModelS', 'new', '/images/A.png');
INSERT INTO items VALUES (20, 'tati', 'AUTOMOTIVE-Motorcycle Gear', 'Helmet', 'M', 'black', 100, 'BrandQ', 'ModelT', 'new', '/images/B.png');
INSERT INTO items VALUES (21, 'tati', 'AUTOMOTIVE-Tools and Equipment', 'Tool Kit', '100-piece', 'N/A', 150, 'BrandR', 'ModelU', 'new', '/images/tooBlkit1.png');

-- Books
INSERT INTO items VALUES (22, 'tati', 'BOOKS-Books', 'Novel', 'N/A', 'N/A', 10, 'BrandS', 'ModelV', 'new', '/images/A.png');
INSERT INTO items VALUES (23, 'tati', 'BOOKS-Magazines', 'Lifestyle Magazine', 'N/A', 'N/A', 5, 'BrandT', 'ModelW', 'new', '/images/B.png');
INSERT INTO items VALUES (24, 'tati', 'BOOKS-Music', 'Music Album', 'N/A', 'N/A', 15, 'BrandU', 'ModelX', 'new', '/images/A.png');

-- Food
INSERT INTO items VALUES (25, 'tati', 'FOOD-Groceries', 'Cereal', '500g', 'N/A', 5, 'BrandV', 'ModelY', 'new', '/images/A.png');
INSERT INTO items VALUES (26, 'tati', 'FOOD-Gourmet Food', 'Truffle Oil', '100ml', 'N/A', 20, 'BrandW', 'ModelZ', 'new', '/images/A.png');
INSERT INTO items VALUES (27, 'tati', 'FOOD-Beverages', 'Coffee', '250g', 'N/A', 10, 'BrandX', 'ModelAA', 'new', '/images/A.png');

-- Office
INSERT INTO items VALUES (28, 'tati', 'OFFICE-Stationery', 'Notebook', 'A4', 'black', 5, 'BrandY', 'ModelBB', 'new', '/images/B.png');
INSERT INTO items VALUES (29, 'tati', 'OFFICE-Office Furniture', 'Desk Chair', 'N/A', 'black', 100, 'BrandZ', 'ModelCC', 'new', '/images/B.png');
INSERT INTO items VALUES (30, 'tati', 'OFFICE-Printers and Scanners', 'Printer', 'N/A', 'white', 150, 'BrandAA', 'ModelDD', 'new', '/images/B.png');

-- Pets
INSERT INTO items VALUES (31, 'tati', 'PETS-Pet Food', 'Dog Food', '10kg', 'N/A', 50, 'BrandBB', 'ModelEE', 'new', '/images/A.png');
INSERT INTO items VALUES (32, 'tati', 'PETS-Pet Toys', 'Cat Toy', 'N/A', 'multicolor', 10, 'BrandCC', 'ModelFF', 'new', '/images/B.png');
INSERT INTO items VALUES (33, 'tati', 'PETS-Pet Grooming', 'Dog Shampoo', '500ml', 'N/A', 15, 'BrandDD', 'ModelGG', 'new', '/images/A.png');

-- Baby
INSERT INTO items VALUES (34, 'tati', 'BABY-Baby Gear', 'Stroller', 'N/A', 'black', 200, 'BrandEE', 'ModelHH', 'new', '/images/A.png');
INSERT INTO items VALUES (35, 'tati', 'BABY-Nursery Furniture', 'Crib', 'N/A', 'white', 300, 'BrandFF', 'ModelII', 'new', '/images/B.png');
INSERT INTO items VALUES (36, 'tati', 'BABY-Baby Clothing', 'Onesie', '6 months', 'blue', 10, 'BrandGG', 'ModelJJ', 'new', '/images/A.png');

-- Jewelry
INSERT INTO items VALUES (37, 'tati', 'JEWELRY-Fine Jewelry', 'Diamond Ring', 'N/A', 'gold', 1000, 'BrandHH', 'ModelKK', 'new', '/images/A.png');
INSERT INTO items VALUES (38, 'tati', 'JEWELRY-Fashion Jewelry', 'Necklace', 'N/A', 'silver', 50, 'BrandII', 'ModelLL', 'new', '/images/A.png');
INSERT INTO items VALUES (39, 'tati', 'JEWELRY-Watches', 'Watch', 'N/A', 'black', 50, 'BrandII', 'ModelLL', 'new', '/images/G.png');
INSERT INTO items VALUES (40, 'tati', 'JEWELRY-Watches', 'Watch', 'N/A', 'silver', 1000, 'Rolex', 'ModelLL', 'new', '/images/H.png');
INSERT INTO items VALUES (41, 'tati', 'JEWELRY-Watches', 'Watch', 'N/A', 'gold', 50, 'BrandII', 'ModelLL', 'new', '/images/I.png');
INSERT INTO items VALUES (42, 'tati', 'JEWELRY-Watches', 'Watch', 'N/A', 'silver', 50, 'Rolex', 'ModelLL', 'new', '/images/J.png');

INSERT INTO items VALUES (43, 'T', 'ELECTRONICS-Cameras', 'Vintage Camera', 'N/A', 'black', 1000, 'Fuji', '1234', 'Muito Usado', '/images/F.png');

INSERT INTO comment VALUES(1,1, 'user1', 'What is the price?');