# -*- coding: utf-8 -*-
import scrapy
from scrapy.http import HtmlResponse
from jobparser.items import JobparserItem


class SuperjobSpider(scrapy.Spider):
    name = 'superjob'
    allowed_domains = ['superjob.ru']
    start_urls = ['https://www.superjob.ru/vacancy/search/?keywords=Python&geo%5Bt%5D%5B0%5D=4',
                  'https://spb.superjob.ru/vacancy/search/?keywords=Python']

    def parse(self, response:HtmlResponse):
        next_page = response.xpath('//a[@class="icMQ_ bs_sM _3ze9n _1M2AW f-test-button-dalshe f-test-link-Dalshe"]/@href').get()
        #print(next_page)
        if next_page:
            yield response.follow(next_page, callback=self.parse)
        links = response.xpath('//div[@class="jNMYr GPKTZ _1tH7S"]/span/a/@href').getall()
        for link in links:
            yield response.follow(link, callback=self.vacancy_parse)

    def vacancy_parse(self, response:HtmlResponse):
        name = response.xpath('//h1//text()').get()
        salary = response.xpath("//span[@class='_2Wp8I _1e6dO _1XzYb _3Jn4o']//text()").getall()
        link = response.url
        item = JobparserItem(name=name, salary=salary, link=link)
        # print(name)
        # print(salary)
        # print(link)
        yield item



