# -*- coding: utf-8 -*-
"""
Created on 5 de junho de 2020

@author: Cristiano Serafim Lauffer
"""

import psycopg2


class PostgreSqlConnection:
    def __init__(self, config):
        self.connection = None
        self.config = config

    def insert_list(self, str_insert, obj_list):
        self.connection = psycopg2.connect(
            host=self.config.host,
            database=self.config.database,
            user=self.config.user,
            password=self.config.password
        )
        cursor = self.connection.cursor()
        cursor.executemany(str_insert, obj_list)
        self.connection.commit()
        cursor.close()
        self.connection.close()

    def truncate_table(self, str_table):
        self.connection = psycopg2.connect(
            host=self.config.host,
            database=self.config.database,
            user=self.config.user,
            password=self.config.password
        )
        cursor = self.connection.cursor()
        cursor.execute("TRUNCATE TABLE " + str_table)
        self.connection.commit()
        cursor.close()
        self.connection.close()

    def execute(self, str_sql):
        self.connection = psycopg2.connect(
            host=self.config.host,
            database=self.config.database,
            user=self.config.user,
            password=self.config.password
        )
        cursor = self.connection.cursor()
        cursor.execute(str_sql)
        self.connection.commit()
        cursor.close()
        self.connection.close()
