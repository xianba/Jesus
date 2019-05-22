# -*- coding: utf-8 -*-

# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: https://doc.scrapy.org/en/latest/topics/item-pipeline.html


import sys
import json

reload(sys)
sys.setdefaultencoding('utf-8')


class InfoCrawlerPipeline(object):
    def __init__(self):
        self.file = open('info_file.json', 'wb+')

    def process_item(self, item, spider):
        str_data = json.dumps(dict(item),ensure_ascii=False) + ',\n'
        self.file.write(str_data)
        return item

    def __del__(self):
        self.file.close()

