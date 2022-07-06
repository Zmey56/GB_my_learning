from lxml import html
import requests
from pprint import pprint

header = {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36'}

response = requests.get('https://ru.ebay.com/b/Chandeliers-Ceiling-Fixtures/117503/bn_818491', headers=header)

dom = html.fromstring(response.text)

lights = []
items = dom.xpath("//li[contains(@class,'s-item')]")

for item in items:
    light = {}

    name = item.xpath(".//h3[@class='s-item__title']/text()")[0]
    link = item.xpath(".//h3[@class='s-item__title']/../@href")[0]
    price = item.xpath(".//span[@class='s-item__price']//text()")
    add_info = item.xpath(".//span[contains(@class,'s-item__hotness')]/span/text()")

    light['name'] = name
    light['link'] = link
    light['price'] = price
    light['add_info'] = add_info

    lights.append(light)

pprint(lights)


