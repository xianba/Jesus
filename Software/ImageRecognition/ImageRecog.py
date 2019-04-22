#!/usr/bin/env python
# -*- encoding: utf-8 -*-
'''
@File    :   ImageRecog.py
@Version :   1.0.0
@Author  :   xiaxianba
@License :   (C) Copyright 2006-2019, Proya
@Contact :   xiaxianba@qq.com
@Software:   PyCharm
@Time    :   2019/4/22 13:10
@Desc    :
'''

import pytesseract
from PIL import Image
import sys

reload(sys)
sys.setdefaultencoding('utf-8')


def image_handle():
    image = Image.open("testchinese.jpg")
    text = pytesseract.image_to_string(image, lang='chi_sim')

    with open("output.txt", 'w') as file:
        print(text)
        file.write(str(text))


if __name__ == '__main__':
    image_handle()
