SELECT *
FROM hotels
INNER JOIN booking_requests
ON hotels.location = booking_requests.client_destination;

SELECT *
FROM hotels
LEFT JOIN booking_requests
ON hotels.location = booking_requests.client_destination;

SELECT *
FROM booking_requests
LEFT JOIN hotels
ON hotels.location = booking_requests.client_destination;

SELECT *
FROM hotels
RIGHT JOIN booking_requests
ON hotels.location = booking_requests.client_destination;


