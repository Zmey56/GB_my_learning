# Define here the models for your scraped items
#
# See documentation in:
# https://docs.scrapy.org/en/latest/topics/items.html

import scrapy
import re
from itemloaders.processors import MapCompose, TakeFirst

def convert_price(value):
    try:
        return float(value)
    except:
        return value

def replace_definition(str_value):
    pattern = re.compile('\\n +')
    values = re.sub(pattern, '', str_value)
    return values

class LeroymerlinparserItem(scrapy.Item):
    # define the fields for your item here like:
    name = scrapy.Field(output_processor=TakeFirst())
    price = scrapy.Field( output_processor=TakeFirst(), input_processor=MapCompose(convert_price))
    url = scrapy.Field(output_processor=TakeFirst())
    pictures = scrapy.Field()
    term = scrapy.Field()
    definition = scrapy.Field(input_processor=MapCompose(replace_definition))


