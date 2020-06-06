# -*- coding: utf-8 -*-
"""
Created on 5 de junho de 2020

@author: Cristiano Serafim Lauffer
"""

import urllib.request
import json
import gzip


class UtilURL:

    @staticmethod
    def json_load_from_url_gzipped(url):
        """Carrega um json a partir de uma url com o formato gzip"""

        response = urllib.request.urlopen(url)
        gzp_data = rsp_data = response.read()

        for header_atb in response.headers._headers:
            if header_atb[0].upper() == 'CONTENT-ENCODING' and header_atb[1].upper() == 'GZIP':
                gzp_data = gzip.decompress(rsp_data)
                break

        return json.loads(gzp_data)
