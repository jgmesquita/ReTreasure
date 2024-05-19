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
INSERT INTO users VALUES ('W', '12345678W', 'Tatiana', 'Lin', 'adress', 'city', 'country', 'postalCode', 'email', 'phone');
INSERT INTO users VALUES ('T', '87654321', 'Tatiana', 'Lin', 'adress', 'city', 'country', 'postalCode', 'email', 'phone');
INSERT INTO users VALUES ('L', '98989898', 'Tatiana', 'Lin', 'adress', 'city', 'country', 'postalCode', 'email', 'phone');

INSERT INTO adminUser VALUES ('jgmesquita');


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
INSERT INTO items VALUES (1, 'W', 'ELECTRONICS-Mobile Phones', 'Smartphone', 'M', 'black', 900, 'Apple', '12 Pro', 'Pouco Usado', '/images/C.png');
INSERT INTO items VALUES (2, 'W', 'ELECTRONICS-Laptops and Computers', 'Laptop', '15-inch', 'silver', 1000, 'BrandY', 'ModelB', 'Novo', '/images/D.png');
INSERT INTO items VALUES (3, 'W', 'ELECTRONICS-Cameras', 'DSLR Camera', 'N/A', 'black', 500, 'BrandZ', 'ModelC', 'Novo', '/images/E.png');

-- Fashion
INSERT INTO items VALUES (4, 'W', 'FASHION-Clothing', 'Dress', 'S', 'blue', 20, 'BrandA', 'ModelD', 'Novo', '/images/dress3.png');
INSERT INTO items VALUES (5, 'W', 'FASHION-Footwear', 'Sneakers', '37', 'white-beige', 60, 'Nike', 'ModelE', 'Novo', '/images/shoes.png');
INSERT INTO items VALUES (6, 'W', 'FASHION-Accessories', 'Earring', 'N/A', 'gold', 150, 'BrandC', 'ModelF', 'Pouco Usado', '/images/B.png');

-- Home
INSERT INTO items VALUES (7, 'W', 'HOME-Furniture', 'Sofa', '3-seater', 'beige', 200, 'BrandD', 'ModelG', 'Muito Usado', '/images/sofa.png');
INSERT INTO items VALUES (8, 'W', 'HOME-Home Decor', 'Wall Art', 'N/A', 'multicolor', 80, 'BrandE', 'ModelH', 'Novo', '/images/A.png');
INSERT INTO items VALUES (9, 'W', 'HOME-Kitchenware', 'Cookware Set', '10-piece', 'stainless steel', 100, 'BrandF', 'ModelI', 'Novo', '/images/cook.png');

-- Health
INSERT INTO items VALUES (10, 'W', 'HEALTH-Skincare', 'Moisturizer', '50ml', 'N/A', 60, 'Lamer', 'ModelJ', 'Novo', '/images/lamer.png');
INSERT INTO items VALUES (11, 'W', 'HEALTH-Haircare', 'Shampoo', '250ml', 'N/A', 30, 'Loreal', 'ModelK', 'Novo', '/images/shampoo.png');
INSERT INTO items VALUES (12, 'W', 'HEALTH-Makeup', 'Lipstick', 'N/A', 'red', 80, 'YSL', 'ModelL', 'Novo', '/images/ysl.png');

-- Sports
INSERT INTO items VALUES (13, 'W', 'SPORTS-Exercise Equipment', 'Treadmill', 'N/A', 'black', 800, 'BrandJ', 'ModelM', 'Novo', '/images/treadmill.png');
INSERT INTO items VALUES (14, 'W', 'SPORTS-Outdoor Gear', 'Tent', '4-person', 'green', 100, 'BrandK', 'ModelN', 'Novo', '/images/tent.png');
INSERT INTO items VALUES (15, 'W', 'SPORTS-Sports Apparel', 'Running Shorts', 'M', 'grey', 25, 'Nike', 'ModelO', 'Muito Usado', '/images/shorts.png');

-- Toys
INSERT INTO items VALUES (16, 'W', 'TOYS-Action Figures', 'Superhero Figure', 'N/A', 'multicolor', 20, 'BrandM', 'ModelP', 'Novo', '/images/superhero.png');
INSERT INTO items VALUES (17, 'W', 'TOYS-Puzzles and Board Games', 'Puzzle', '1000 pieces', 'multicolor', 50, 'BrandN', 'ModelQ', 'Muito Usado', '/images/puzzle.png');
INSERT INTO items VALUES (18, 'W', 'TOYS-Arts and Crafts', 'Paint Set', 'N/A', 'multicolor', 15, 'BrandO', 'ModelR', 'Novo', '/images/paint.png');

-- Automotive
INSERT INTO items VALUES (19, 'W', 'AUTOMOTIVE-Car Accessories', 'Car Cover', 'N/A', 'grey', 30, 'BrandP', 'ModelS', 'Muito Usado', '/images/carcover.png');
INSERT INTO items VALUES (20, 'W', 'AUTOMOTIVE-Motorcycle Gear', 'Helmet', 'M', 'black', 100, 'BrandQ', 'ModelT', 'Novo', '/images/helmet.png');
INSERT INTO items VALUES (21, 'W', 'AUTOMOTIVE-Cars', 'Car', 'N/A', 'N/A', 15000, 'BrandR', 'ModelU', 'Muito Usado', '/images/car.png');

-- Books
INSERT INTO items VALUES (22, 'W', 'BOOKS-Books', 'Novel', 'N/A', 'N/A', 10, 'BrandS', 'ModelV', 'Pouco Usado', '/images/book.png');
INSERT INTO items VALUES (23, 'W', 'BOOKS-Magazines', 'Fashion Magazine', 'N/A', 'N/A', 20, 'Vogue', 'ModelW', 'Novo', '/images/vogue.png');
INSERT INTO items VALUES (24, 'W', 'BOOKS-Music', 'Music Album', 'N/A', 'N/A', 35, 'BrandU', 'ModelX', 'Pouco Usado', '/images/album.png');

-- Office
INSERT INTO items VALUES (25, 'W', 'OFFICE-Stationery', 'Notebook', 'A3', 'green', 5, 'BrandY', 'ModelBB', 'Novo', '/images/nb.png');
INSERT INTO items VALUES (26, 'W', 'OFFICE-Office Furniture', 'Desk Chair', 'N/A', 'white', 100, 'BrandZ', 'ModelCC', 'Novo', '/images/deskchair.png');
INSERT INTO items VALUES (27, 'W', 'OFFICE-Printers and Scanners', 'Printer', 'N/A', 'black', 150, 'BrandAA', 'ModelDD', 'Muito Usado', '/images/printer.png');

-- Jewelry
INSERT INTO items VALUES (39, 'W', 'JEWELRY-Watches', 'Watch', 'N/A', 'black', 50, 'BrandII', 'ModelLL', 'Novo', '/images/G.png');
INSERT INTO items VALUES (40, 'W', 'JEWELRY-Watches', 'Watch', 'N/A', 'silver', 1000, 'Rolex', 'ModelLL', 'Novo', '/images/H.png');
INSERT INTO items VALUES (41, 'W', 'JEWELRY-Watches', 'Watch', 'N/A', 'gold', 50, 'BrandII', 'ModelLL', 'Novo', '/images/I.png');
INSERT INTO items VALUES (42, 'W', 'JEWELRY-Watches', 'Watch', 'N/A', 'silver', 50, 'Rolex', 'ModelLL', 'Novo', '/images/J.png');

INSERT INTO items VALUES (43, 'T', 'ELECTRONICS-Cameras', 'Vintage Camera', 'N/A', 'black', 1000, 'Fuji', '1234', 'Muito Usado', '/images/F.png');

INSERT INTO items VALUES (44, 'T', 'FASHION-Clothing', 'Dress', 'L', 'white', 40, 'ZARA', 'ModelD', 'Novo', '/images/dress.png');
INSERT INTO items VALUES (45, 'T', 'HOME-Home Decor', 'Wall Art', 'N/A', 'multicolor', 10000, 'BrandE', 'ModelH', 'Novo', '/images/art.png');
INSERT INTO items VALUES (46, 'W', 'FASHION-Clothing', 'Dress', 'S', 'blue', 20, 'BrandA', 'ModelD', 'Pouco Usado', '/images/dress2.png');
INSERT INTO items VALUES (47, 'L', 'HEALTH-Makeup', 'Lipstick', 'N/A', 'red', 60, 'YSL', 'ModelL', 'Novo', '/images/ysl2.png');

INSERT INTO items VALUES (48, 'L', 'BOOKS-Books', 'Novel', 'N/A', 'N/A', 20, 'BrandS', 'ModelV', 'Pouco Usado', '/images/book2.png');
INSERT INTO items VALUES (49, 'T', 'BOOKS-Magazines', 'Fashion Magazine', 'N/A', 'N/A', 40, 'Vogue', 'ModelW', 'Novo', '/images/vogue2.png');
INSERT INTO items VALUES (50, 'W', 'BOOKS-Music', 'Music Album', 'N/A', 'N/A', 25, 'BrandU', 'ModelX', 'Pouco Usado', '/images/album2.png');

INSERT INTO comment VALUES(1,1, 'user1', 'What is the price?');