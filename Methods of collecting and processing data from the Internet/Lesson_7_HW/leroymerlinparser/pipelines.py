# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: https://docs.scrapy.org/en/latest/topics/item-pipeline.html


# useful for handling different item types with a single interface
import scrapy
from itemadapter import ItemAdapter
from scrapy.pipelines.images import ImagesPipeline


class LeroymerlinparserPipeline:
    def process_item(self, item, spider):
        print()
        return item

class LeroymerlinPicturesPipeline(ImagesPipeline):
    def get_media_requests(self, item, info):
        if item['pictures']:
            for img in item['pictures']:
                try:
                    yield scrapy.Request(img)
                except Exception as e:
                    print(e)
    def item_completed(self, results, item, info):
        item['pictures'] = [itm[1] for itm in results if itm[0]]
        return item
