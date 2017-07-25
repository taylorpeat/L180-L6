SELECT name AS "Bid on items" FROM items
WHERE id IN (SELECT item_id FROM bids);

SELECT name AS "Bid on items" FROM items
WHERE id NOT IN (SELECT item_id FROM bids);

SELECT name FROM bidders
WHERE EXISTS (SELECT * FROM bids WHERE bidder_id = bidders.id);

SELECT name AS "Highest Bid Less Than 100 Dollars" FROM items
WHERE id = ANY (SELECT DISTINCT item_id FROM bids WHERE amount < 100);

SELECT name AS "Highest Bid Less Than 100 Dollars" FROM items
WHERE 100 > ALL (SELECT amount FROM bids WHERE item_id = items.id);