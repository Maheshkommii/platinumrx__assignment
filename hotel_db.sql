CREATE TABLE users (
    user_id INT,
    name VARCHAR(50)
);

CREATE TABLE bookings (
    booking_id INT,
    user_id INT,
    booking_date DATE
);

CREATE TABLE items (
    item_id INT,
    item_name VARCHAR(50),
    rate INT
);

CREATE TABLE booking_commercials (
    booking_id INT,
    item_id INT,
    quantity INT
);