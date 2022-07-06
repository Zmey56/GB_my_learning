import scrapy
from scrapy.http import HtmlResponse
from jobparser.items import JobparserItem

class HhruSpider(scrapy.Spider):
    name = 'hhru'
    allowed_domains = ['hh.ru']
    start_urls = ['https://hh.ru/search/vacancy?area=1&search_field=name&search_field=company_name&search_field=description&fromSearchLine=true&text=Python&from=suggest_post',
                  'https://hh.ru/search/vacancy?area=2&search_field=name&search_field=company_name&search_field=description&fromSearchLine=true&text=Python&from=suggest_post']

    def parse(self, response:HtmlResponse):
        next_page = response.xpath('//a[@data-qa="pager-next"]/@href').get()
        if next_page:
            yield response.follow(next_page, callback=self.parse)
        links = response.xpath('//a[@data-qa="vacancy-serp__vacancy-title"]/@href').getall()
        for link in links:
            yield response.follow(link, callback=self.vacancy_parse)

        #print(response.url)
    def vacancy_parse(self, response: HtmlResponse):
        name = response.xpath('//h1//text()').get()
        salary = response.xpath("//div[@class='vacancy-salary']//text()").getall()
        link = response.url
        item = JobparserItem(name=name, salary=salary, link=link)
        yield item
