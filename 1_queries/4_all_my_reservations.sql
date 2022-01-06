SELECT reservations.*, properties.*, avg(rating) as average_rating
FROM property_reviews 
JOIN users ON users.id = guest_id
JOIN properties ON properties.id = property_id
JOIN reservations ON reservations.id = reservation_id
WHERE users.id = 1
GROUP BY properties.id, reservations.id
HAVING end_date < now()::date
ORDER BY start_date
LIMIT 10;