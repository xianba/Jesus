#!/usr/bin/env python
# -*- encoding: utf-8 -*-
"""
@File    :   data_gene.py
@Version :   1.0.0
@Author  :   xiaxianba
@License :   (C) Copyright 2006-2019
@Contact :   xiaxianba@qq.com
@Software:   PyCharm
@Time    :   2019/7/31 17:45
@Desc    :
"""

import json
import re
import urllib2

baidu = {'url': 'http://www.baidu.com', 'keyword': ['下载百度APP', '没事看一看', '瞧瞧', 'baidu']}
cninfo = {'url': 'http://www.cninfo.com.cn/new/index', 'keyword': ['金轮股份', '通达股份']}

response = urllib2.urlopen(cninfo['url'])
html = response.read()

print html

dict_tmp = {}
for key in cninfo['keyword']:
    key_num = len(re.findall(key, html))
    dict_tmp[key] = key_num

result = json.dumps(dict_tmp, encoding='UTF-8', ensure_ascii=False)    # 解决显示中文乱码问题
print result

# print type(html)
# print html
#
# for key in baidu['keyword']:
#     if key in html:
#         print '*'*20
#     else:
#         print '+'*20

