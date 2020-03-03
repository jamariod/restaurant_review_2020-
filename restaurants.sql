CREATE TABLE restaurant
(
    id serial PRIMARY KEY,
    name text NOT NULL,
    distance integer,
    stars integer,
    category text,
    favorite_dish text,
    takeout boolean,
    ate_last timestamp
);

CREATE TABLE reviewer
(
    id serial PRIMARY KEY,
    name text NOT NULL,
    email varchar,
    karma int CHECK (karma <= 7)
);

CREATE TABLE review
(
    id serial PRIMARY KEY,
    reviewer_id int,
    restaurant_id int,
    stars int CHECK (stars <= 5) NOT NULL,
    title text,
    review text,
    FOREIGN KEY (reviewer_id) REFERENCES reviewer (id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurant (id)
);
INSERT INTO restaurant
    (name, distance, stars, category, favorite_dish, takeout, ate_last)
VALUES
    ('Taco Bell', 10, 3, 'Mexican', 'Chicken Taco', TRUE, '2020-02-24 11:10:00'),
    ('KFC', 12, 2, 'American', 'Hot Wings', TRUE, '2020-02-02 10:30:00'),
    ('Pizza Hut', 3, 4, 'American', 'Beef Pizza', TRUE, '2020-02-28 02:30:00');

INSERT INTO reviewer
    (name, email, karma)
VALUES
    ('Tony Stark', 'tStark@gmail.com', 3),
    ('Jim Kelly', 'bills12@hotmail.com', 6),
    ('Bart Simpson', 'bSimpson@aol.com', 5);

INSERT INTO review
    (reviewer_id, restaurant_id, stars, title, review)
VALUES
    (1, 2, 5, 'Great time', 'I stop by during lunch and had a great time eat and drinking with friends'),
    (2, 1, 1, 'Last time coming to this restaurant', 'It took an hour to be seating during dinner time. Only one host was working during the dinner shift.'),
    (3, 3, 3, 'Ok service', 'The wait time was longer than normal during normal and the food was cold.');
-- List all restaurants --
SELECT name
FROM restaurant;
-- List a single restaurant by ID --
SELECT *
FROM review
WHERE restaurant_id = 1;
--List all the reviews for a given restaurant, given a specific restaurant name. --
SELECT review.review, restaurant.name
FROM review INNER JOIN restaurant ON review.restaurant_id = restaurant.id;

-- List all the reviews along with the restaurant they were written for. --
-- In the query result, select the restaurant name and the review --

SELECT review.review
FROM review
    INNER JOIN restaurant ON review.restaurant_id = restaurant.id
WHERE restaurant.name = 'KFC';