#!/usr/bin/env python
# -*- encoding: utf-8 -*-
"""
@File    :   info_spider.py
@Version :   1.0.0
@Author  :   xiaxianba
@License :   (C) Copyright 2006-2019
@Contact :   xiaxianba@qq.com
@Software:   PyCharm
@Time    :   2019/5/22 11:22
@Desc    :
"""

import scrapy


class InfoSpider(scrapy.Spider):
    name = 'info_spider'
    start_urls = ['http://www.gov.cn/']

    def parse(self, response):

        if str(response.url) == 'http://www.gov.cn/':
            info_web = "政府网"

            for ul in response.css('ul.h120 li'):
                yield {
                    'info_title': ul.css('a::text').get(),
                    # 'info_web': ul.xpath('a/text()').get(),
                    'info_web': info_web,
                    # 'info_url': ul.css('a::attr(href)').get(),
                    'info_url': ul.xpath('a[contains(@href,"http")]/@href').extract()
                }