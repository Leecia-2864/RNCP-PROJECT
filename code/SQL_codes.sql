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












