#!/usr/bin/env python
# -*- encoding: utf-8 -*-
"""
@File    :   main.py
@Version :   1.0.0
@Author  :   xiaxianba
@License :   (C) Copyright 2006-2019
@Contact :   xiaxianba@qq.com
@Software:   PyCharm
@Time    :   2019/5/22 11:20
@Desc    :
"""

from scrapy import cmdline

cmdline.execute(['scrapy', 'crawl', 'info_spider'])