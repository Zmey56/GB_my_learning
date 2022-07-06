
# Распределение трейдеров по странам
CREATE VIEW trader_country AS
SELECT c.country, COUNT(*) AS number_people FROM trader t JOIN country c ON t.country_id = c.id GROUP BY c.country ;

# Распределение количества предложений на покупку по трейдерам

DROP VIEW trader_offer_buy;
CREATE VIEW trader_offer_buy AS
SELECT user_name,  COUNT(o.buy) AS sum_offer_buy FROM trader t JOIN offer o ON t.id = o.trader_id WHERE o.buy = 1 GROUP BY t.user_name ORDER BY sum_offer_buy DESC;


# Распределение количества предложений на продажу по трейдерам
DROP VIEW trader_offer_sell;
CREATE VIEW trader_offer_sell AS
SELECT user_name,  COUNT(o.sell) AS sum_offer_sell FROM trader t JOIN offer o ON t.id = o.trader_id WHERE o.sell = 1 GROUP BY t.user_name ORDER BY sum_offer_sell DESC;

SELECT * FROM trader_country tc ;

SELECT * FROM trader_offer_sell ;

SELECT * FROM trader_offer_buy tob  ;