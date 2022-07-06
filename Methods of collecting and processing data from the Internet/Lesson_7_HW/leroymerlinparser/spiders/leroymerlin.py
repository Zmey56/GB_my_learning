import scrapy
from scrapy.http import HtmlResponse
from leroymerlinparser.items import LeroymerlinparserItem
from scrapy.loader import ItemLoader


class LeroymerlinSpider(scrapy.Spider):
    name = 'leroymerlin'
    allowed_domains = ['leroymerlin.ru']


    def __init__(self, search, **kwargs):
        super().__init__(**kwargs)
        self.start_urls = [f'https://leroymerlin.ru/search/?q={search}&family=7f8ab360-4691-11ea-b7ce-8d83641e7e8e&suggest=true']

    def parse(self, response: HtmlResponse):
        next_page = response.xpath("//a[@data-qa-pagination-item='right']/@href").get()
        if next_page:
            yield response.follow(next_page, callback=self.parse)

        links = response.xpath('//a[@data-qa="product-name"]')
        for link in links:
            yield response.follow(link, callback=self.parse_ads)

    def parse_ads(self, response: HtmlResponse):
        loader = ItemLoader(item=LeroymerlinparserItem(), response=response)
        loader.add_xpath('name', "//h1/text()")
        loader.add_xpath('price', "//uc-pdp-price-view[@slot='primary-price']/meta[@itemprop='price']/@content")
        loader.add_xpath('pictures', "//source[@media='(max-width: 767px)']/@srcset")
        loader.add_value('url', response.url)
        loader.add_xpath('term', "//div[@class='def-list__group']/dt[@class='def-list__term']/text()")
        loader.add_xpath('definition', "//div[@class='def-list__group']/dd[@class='def-list__definition']/text()")
        yield loader.load_item()



