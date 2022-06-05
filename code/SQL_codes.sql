create database if not exists Airbnb;
use Airbnb;

CREATE TABLE IF NOT EXISTS hosts(
    host_id INTEGER NOT NULL PRIMARY KEY,
    host_name VARCHAR(50) NOT NULL,
    host_since VARCHAR(50) NOT NULL,
    host_location VARCHAR(50) NOT NULL
);
CREATE TABLE IF NOT EXISTS price (
    id INTEGER NOT NULL PRIMARY KEY,
    price float NOT NULL,
    weekly_price float NOT NULL,
    monthly_price float NOT NULL
    );

CREATE table if not exists property(
id INTEGER NOT NULL PRIMARY KEY,
room_type VARCHAR(255) NOT NULL,
price INTEGER NOT NULL,
minimum_nights INTEGER NOT NULL,
number_of_reviews INTEGER NOT NULL,
host_listings_count INTEGER NOT NULL,
availability_30 INTEGER NOT NULL,
availability_60 INTEGER NOT NULL,
availability_90 INTEGER NOT NULL,
availability_365 INTEGER NOT NULL,
neighbourhood varchar(100),
host_id INTEGER NOT NULL,
price_id INTEGER NOT NULL,
FOREIGN KEY(host_id) REFERENCES hosts(host_id),
FOREIGN KEY(price_id) REFERENCES price(id)
);


CREATE TABLE IF NOT EXISTS  reviews(
    listing_id INTEGER NOT NULL PRIMARY KEY,
    id INTEGER NOT NULL,
    date date NOT NULL,
    reviewers_id INTEGER NOT NULL,
    reviewers_name VARCHAR(50) NOT NULL,
    comments VARCHAR(50) NOT NULL,
    property_id INTEGER NOT NULL,
    FOREIGN KEY(property_id) REFERENCES property(id)
);

## SQL CODES
-------- What is the avarage price per night of an Airbnb in Paris------
SELECT round(avg(price)) as AVG_Price
FROM prices;
------- The average price per night of an Airbnb in Paris is 111 euros ------

## SQL CODES
-------- How does the average price of an Airbnb listing, per month, compare to the private rental market?-------
SELECT round(avg(monthly_price),2) as Average_price_per_month
FROM prices;
--------- The average monthly price of an airbnb listing  as compared to the mormal rental market is quite highh-----

## SQL CODES
-------- What is the number of listings per room type --------
SELECT room_type, COUNT(room_type) 
FROM property
GROUP BY room_type;
-------- We can see that entire home and apartments has the number of listings ----------

## SQL CODES
------ what are the top 5 most expensive neighbours per night -------
SELECT property.neighbourhood, AVG(prices.price) as AVG_PRICE  
FROM property
JOIN prices ON
prices.id = property.id
GROUP BY 1
ORDER by 2
DESC LIMIT 5;
------ It is seen that the top 5 most expensive airbnb per night in paris are Louvre, XIV Arrondissement, Madeleine, Champs-Elysees, and Chatelet.-------


## SQL CODES
--------- We want to known thename of the host with the most reviews -------
SELECT host_name as HOST, property.neighbourhood as NEIGHBOURHOOD, count(reviews.reviewer_id) as NUMBER_OF_REVIEWS
FROM property
JOIN host on property.id = host.host_id
JOIN reviews on property.id = reviews.listing_id
ORDER BY 3 DESC
LIMIT 1











