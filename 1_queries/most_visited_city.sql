SELECT city, COUNT(reservations.start_date) AS total_reservations
FROM properties
JOIN reservations ON properties.id = property_id
GROUP BY city 
ORDER BY COUNT(reservations.id) DESC;
