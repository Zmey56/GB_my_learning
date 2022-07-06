CREATE DATABASE IF NOT EXISTS coursework_portfolio;
USE coursework_portfolio;


# увидел проект с криптовалютами. Соответственно состоит из трех блоков

# CURRENCIES

# Сначало создаю страну из которой осуществляется торговля
DROP TABLE IF EXISTS country;

CREATE TABLE country(
	id SERIAL PRIMARY KEY,
	country VARCHAR(128)
) COMMENT = 'Страна из которой осуществляется торговля';

# Валюту которую использует пользователь для торговли
DROP TABLE IF EXISTS currency_used;

CREATE TABLE currency_used(
	id SERIAL PRIMARY KEY,
	country_id BIGINT UNSIGNED NOT NULL COMMENT 'Ключ на другую таблицу',
	currency_id INT UNSIGNED COMMENT 'Ключ на другую таблицу',
	data_from DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата начала использования валюты',
	data_to DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата окончания использования валюты. Если NULL, то валюта до сих пор используется'
) COMMENT = 'Валюта использованная для покупки';

DESC currency_used ;

# Хранятся текущие и исторические курсы между валютными парами.
DROP TABLE IF EXISTS currency_rate;

CREATE TABLE currency_rate(
	id SERIAL PRIMARY KEY,
	currency_id INT UNSIGNED COMMENT 'Ключ на другую таблицу',
	base_currency_id INT UNSIGNED COMMENT 'Ключ на другую таблицу',
	rate DECIMAL(16,6) NOT NULL DEFAULT 0 COMMENT 'Курс валюты',
	ts DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Время в которое данный курс был зафиксирован'
) COMMENT = 'Курс валюты';

# Хранить все валюты, которые мы когда-либо использовали для торговли.
DROP TABLE IF EXISTS currency;

CREATE TABLE currency(
	id INT UNSIGNED PRIMARY KEY,
	code VARCHAR(8) NOT NULL UNIQUE COMMENT 'Код используемый для уникального обозначения валюты',
	name VARCHAR(128) NOT NULL UNIQUE COMMENT 'Уникальное название этой валюты',
	is_active BOOL DEFAULT FALSE COMMENT 'Если валюта в настоящее время активна в нашей системе',
	is_base_currency BOOL DEFAULT FALSE COMMENT 'Если эта валюта является базовой валютой нашей системы.'
) COMMENT = 'Курс валюты';

# ITEMS
/* Таблицы item определяют все товары, доступные для торговли, и их текущий статус. 
 * Также здесь записываются все изменения, произошедшие с этими товарами с течением времени.
 */
DROP TABLE IF EXISTS item;

CREATE TABLE item(
	id SERIAL PRIMARY KEY,
	code VARCHAR(64) NOT NULL UNIQUE COMMENT 'Код используемый для уникального обозначения товара(акции, ПИФы и т.д.)',
	name VARCHAR(255) NOT NULL UNIQUE COMMENT 'Полное имя',
	is_active BOOL DEFAULT FALSE COMMENT 'Доступен ли этот товар для торговли или нет',
	currency_id INT UNSIGNED COMMENT 'Ссылается на валюту, используемую в качестве базовой валюты для данного товара',
	details TEXT COMMENT 'Все дополнительные сведения (например, количество выпущенных акций) в текстовом формате.'
) COMMENT = 'Доступные товары';

# Таблица цен отслеживает все изменения цен во времени. 
DROP TABLE IF EXISTS price;

CREATE TABLE price(
	id SERIAL PRIMARY KEY,
	item_id BIGINT UNSIGNED COMMENT 'Ссылается на валюту, используемую в качестве базовой валюты для данного товара',
	currency_id INT UNSIGNED COMMENT 'Ссылается на валюту, используемую в качестве базовой валюты для данного товара',
	buy DECIMAL(16,6) NOT NULL DEFAULT 0 COMMENT 'Курс покупки',
	sell DECIMAL(16,6) NOT NULL DEFAULT 0 COMMENT 'Курс продажи',
	ts DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Время в которое сделка по последней цене была зафиксирована'
) COMMENT = 'Изменение цены';

# Таблица отчета

DROP TABLE IF EXISTS report;

CREATE TABLE report(
	id SERIAL PRIMARY KEY,
	trading_data DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата отчета',
	item_id BIGINT UNSIGNED COMMENT 'Ссылается на валюту, используемую в качестве базовой валюты для данного товара',
	currency_id INT UNSIGNED COMMENT 'Ссылается на валюту, используемую в качестве базовой валюты для данного товара',
	first_price DECIMAL(16,6) DEFAULT NULL COMMENT 'Начальная цена',
	last_price DECIMAL(16,6) DEFAULT NULL COMMENT 'Последняя цена',
	min_price DECIMAL(16,6) DEFAULT NULL COMMENT 'Минимальная цена',
	max_price DECIMAL(16,6) DEFAULT NULL COMMENT 'Максимальная цена',
	avg_price DECIMAL(16,6) DEFAULT NULL COMMENT 'Средняя цена',
	total_amount DECIMAL(16,6) DEFAULT NULL COMMENT 'Общая сумма, уплаченная за этот товар в течение отчетного периода.',
	quantity DECIMAL(16,6) DEFAULT NULL COMMENT 'Количество товаров, проданных в течение данного отчетного периода.'
) COMMENT = 'Отчет';


# TRADERS	
	
# Таблица трейдеров
	
DROP TABLE IF EXISTS trader;

CREATE TABLE trader (
	id SERIAL PRIMARY KEY,
    firstname VARCHAR(50) COMMENT 'Имя',
    lastname VARCHAR(50) COMMENT 'Фамилия', 
    user_name VARCHAR(50) NOT NULL UNIQUE COMMENT 'Логин у всех уникальный', 
    email VARCHAR(120) NOT NULL UNIQUE,
    confirmation_code VARCHAR(120) NOT NULL COMMENT 'Код, отправленный пользователю для завершения процесса регистрации.',
    time_registered DATETIME DEFAULT CURRENT_TIMESTAMP,
    time_confirmed DATETIME DEFAULT CURRENT_TIMESTAMP,
    country_id BIGINT UNSIGNED COMMENT 'Страна, в которой живет.',
    preffered_currency_id BIGINT UNSIGNED COMMENT 'Валюта, которую трейдер предпочитает'
) COMMENT 'юзеры';	
	

# Список всех товаров, которыми в настоящее время владеет трейдер
DROP TABLE IF EXISTS current_inventory;

CREATE TABLE current_inventory (
	id SERIAL PRIMARY KEY,
	trader_id BIGINT UNSIGNED COMMENT 'Ссылка на трейдера',
	item_id BIGINT UNSIGNED COMMENT 'Ссылка на товар',
	quantity DECIMAL(16,6) DEFAULT NULL COMMENT 'Количество товаров'
) COMMENT 'Список товаров';
	
# Торговое событие
DROP TABLE IF EXISTS trade;

CREATE TABLE trade (
	id SERIAL PRIMARY KEY,
	item_id BIGINT UNSIGNED COMMENT 'Ссылка на товар',	
	seller_id BIGINT UNSIGNED DEFAULT NULL COMMENT 'Ссылка на трейдера',
	buyer_id BIGINT UNSIGNED COMMENT 'Ссылка на трейдера',
	quantity DECIMAL(16,6) DEFAULT NULL COMMENT 'Количество товаров',
	unit_price DECIMAL(16,6) DEFAULT NULL COMMENT 'Цена за единицу',
	description TEXT COMMENT 'Все дополнительные сведения (например, количество выпущенных акций) в текстовом формате.',
	offer_id BIGINT UNSIGNED COMMENT 'Индификатор сделки'
) COMMENT 'Сделки';

# Учет всех предложений
DROP TABLE IF EXISTS offer;

CREATE TABLE offer (
	id SERIAL PRIMARY KEY,
	item_id BIGINT UNSIGNED COMMENT 'Ссылка на товар',	
	trader_id BIGINT UNSIGNED DEFAULT NULL COMMENT 'Ссылка на трейдера',
	quantity DECIMAL(16,6) DEFAULT NULL COMMENT 'Количество товаров',
	buy BOOL DEFAULT FALSE,
	sell BOOL DEFAULT FALSE,
	price DECIMAL(16,6) DEFAULT NULL COMMENT 'Желаемая цена за единицу',
	ts DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Когда была выставлена',
	is_active BOOL DEFAULT FALSE COMMENT 'Действует ли еще это предложение'
) COMMENT 'Сделки';	
	
	
	
	
	
	
	



















