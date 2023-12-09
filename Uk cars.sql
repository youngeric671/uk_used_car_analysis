SELECT *
FROM cars

--Average car price by model and make
SELECT make, model, ROUND(AVG(price),2) AS avg_price
FROM cars
GROUP BY make, model
ORDER BY avg_price DESC

--Most popular fuel type
SELECT fuelType,
	COUNT(*) AS Popular_fuelType,
	(COUNT(*) * 100 / SUM(COUNT(*)) OVER()) AS FuelTypePercentage
FROM cars
GROUP BY fuelType
ORDER BY Popular_fuelType DESC

--Impact of transmission type on price
SELECT transmission, Round(AVG(price),2) AS avg_price
FROM cars
GROUP BY transmission
ORDER BY avg_price DESC

--distribution of cars based on transmission
SELECT transmission,
	COUNT(*) AS NumberOfCars,
	(COUNT(*) * 100 / SUM(COUNT(*)) OVER()) AS DistributionPercentage
FROM cars
GROUP BY transmission
ORDER BY DistributionPercentage DESC

--market share/presence of makers and average price
	SELECT make,
		COUNT(*) AS MarketPresence,
		(COUNT(*) * 100 / SUM(COUNT(*)) OVER()) AS MarketPresencePercentage,
		Round(AVG(price),2) AS AveragePrice
	FROM cars
	GROUP BY make 
	ORDER BY MarketPresence DESC

--market share/presence of models and average price
	SELECT TOP 10 model,
		COUNT(*) AS MarketPresence,
		(COUNT(*) * 100 / SUM(COUNT(*)) OVER()) AS MarketPresencePercentage,
		Round(AVG(price),2) AS AveragePrice
	FROM cars
	GROUP BY model
	ORDER BY MarketPresencePercentage DESC

--years with more cars and average price
SELECT year,
	COUNT(*) AS NumberOfCars,
	ROUND(AVG(price), 2) AS AveragePrice
FROM cars
GROUP BY year
ORDER BY year DESC

--correlation between price and mpg
WITH CTE_CORR AS(
	SELECT
		price,
		mpg,
		AVG(price) AS avg_price,
		AVG(mpg) AS avg_mpg
	FROM cars
	GROUP BY price, mpg
)
SELECT price, mpg,
	AVG((price-avg_price)*(mpg-avg_mpg))/(STDEV(price)*STDEV(mpg)) AS Correlation
FROM CTE_CORR
GROUP BY price, mpg
ORDER BY Correlation Desc















