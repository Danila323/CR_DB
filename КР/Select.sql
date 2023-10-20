SELECT * FROM Books ORDER BY Price DESC;

SELECT Category, COUNT(*) AS BookCount FROM Books WHERE Price < 15 GROUP BY Category ORDER BY BookCount DESC LIMIT 5;
