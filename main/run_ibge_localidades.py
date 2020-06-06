# -*- coding: utf-8 -*-
"""
Created on 5 de junho de 2020

@author: Cristiano Serafim Lauffer
"""

from util.url import UtilURL
from config.postgresql import PostgreSqlConfig
from util.postgresql import PostgreSqlConnection
from util.helper_funcoes import HelperFuncoes


# ========================================
# Funções da aplicação
# ========================================
def importar_dados_municipios():
    """Importa dados de municípios disponibilizados a partir da API do IBGE"""
    data = UtilURL.json_load_from_url_gzipped('https://servicodados.ibge.gov.br/api/v1/localidades/municipios')
    config = PostgreSqlConfig('postgresql-db_ibge')
    conn = PostgreSqlConnection(config)
    conn.truncate_table('staging.municipios')

    obj_list = []

    for dado in data:
        obj_list.append(
            (
                dado['id'],
                dado['nome'],
                dado['microrregiao']['id'],
                dado['microrregiao']['nome'],
                dado['microrregiao']['mesorregiao']['id'],
                dado['microrregiao']['mesorregiao']['nome'],
                dado['microrregiao']['mesorregiao']['UF']['id'],
                dado['microrregiao']['mesorregiao']['UF']['nome'],
                dado['microrregiao']['mesorregiao']['UF']['sigla'],
                dado['microrregiao']['mesorregiao']['UF']['regiao']['id'],
                dado['microrregiao']['mesorregiao']['UF']['regiao']['nome'],
                dado['microrregiao']['mesorregiao']['UF']['regiao']['sigla']
            )
        )

    conn.insert_list(
        'insert into staging.municipios values (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)',
        obj_list
    )


if __name__ == '__main__':
    HelperFuncoes.exec_funcao(importar_dados_municipios)
