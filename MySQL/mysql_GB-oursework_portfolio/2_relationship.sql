USE coursework_portfolio;

# связь один ко многим courtry - currency_used
ALTER TABLE currency_used ADD CONSTRAINT currency_used_country_fk FOREIGN KEY(country_id) REFERENCES country(id);

# связь один ко многим currency - currency_used 
ALTER TABLE currency_used 
ADD CONSTRAINT currency_used_currency_fk 
FOREIGN KEY(currency_id) 
REFERENCES currency(id);

# связь один ко многим currency - currency_rate 
ALTER TABLE currency_rate ADD CONSTRAINT currency_currency_rate_fk FOREIGN KEY(currency_id) REFERENCES currency(id);
ALTER TABLE currency_rate ADD CONSTRAINT currency_currency_rate_base_fk FOREIGN KEY(base_currency_id) REFERENCES currency(id);

# связь один ко многим currency - price 
ALTER TABLE price ADD CONSTRAINT currency_price_fk FOREIGN KEY(currency_id) REFERENCES currency(id);

# связь один ко многим currency - item 
ALTER TABLE item ADD CONSTRAINT currency_item_fk FOREIGN KEY(currency_id) REFERENCES currency(id);

# связь один ко многим price - item 
ALTER TABLE price ADD CONSTRAINT item_price_fk FOREIGN KEY(item_id) REFERENCES item(id);

# связь один ко многим report - item 
ALTER TABLE report ADD CONSTRAINT report_item_fk FOREIGN KEY(item_id) REFERENCES item(id);

# связь один ко многим report - currency 
ALTER TABLE report ADD CONSTRAINT currency_report_fk FOREIGN KEY(currency_id) REFERENCES currency(id);

# связь один ко многим trader - currency 
ALTER TABLE trader ADD CONSTRAINT country_trader_fk FOREIGN KEY(country_id) REFERENCES country(id);

# связь один ко многим trade - trader
ALTER TABLE trade ADD CONSTRAINT trader_trade_sell_fk FOREIGN KEY(seller_id) REFERENCES trader(id);

# связь один ко многим trade - trader
ALTER TABLE trade ADD CONSTRAINT trader_trade_buy_fk FOREIGN KEY(buyer_id) REFERENCES trader(id);

# связь один ко многим trade - offer
ALTER TABLE trade ADD CONSTRAINT offer_trade_fk FOREIGN KEY(offer_id) REFERENCES offer(id);

# связь один ко многим trade - item
ALTER TABLE trade ADD CONSTRAINT item_trade_fk FOREIGN KEY(item_id) REFERENCES item(id);

# связь один ко многим offer - trader
ALTER TABLE offer ADD CONSTRAINT trader_offer_fk FOREIGN KEY(trader_id) REFERENCES trader(id);

# связь один ко многим offer - item
ALTER TABLE offer ADD CONSTRAINT item_offer_fk FOREIGN KEY(item_id) REFERENCES item(id);

# связь один ко многим Current_inventory - trader
ALTER TABLE current_inventory ADD CONSTRAINT trader_current_inventory_fk FOREIGN KEY(trader_id) REFERENCES trader(id);

# связь один ко многим Current_inventory - item
ALTER TABLE current_inventory ADD CONSTRAINT item_current_inventory_fk FOREIGN KEY(item_id) REFERENCES item(id);
