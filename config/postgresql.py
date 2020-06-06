# -*- coding: utf-8 -*-
"""
Created on 5 de junho de 2020

@author: Cristiano Serafim Lauffer

exemplos:
https://wiki.python.org/moin/ConfigParserExamples
https://docs.python.org/3/library/configparser.html
"""

import configparser


class PostgreSqlConfig:
    def __init__(self, configuration_section):
        config = configparser.ConfigParser()
        config.read('../config/db.config.ini')
        self.host = config[configuration_section]['host']
        self.database = config[configuration_section]['database']
        self.user = config[configuration_section]['user']
        self.password = config[configuration_section]['password']
