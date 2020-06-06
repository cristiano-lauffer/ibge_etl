# -*- coding: utf-8 -*-
"""
Created on 5 de junho de 2020

@author: Cristiano Serafim Lauffer
"""

from util.url import UtilURL
from config.postgresql import PostgreSqlConfig
from util.postgresql import PostgreSqlConnection
# from config.mysql import MySqlConfig
# from util.mysql import MySqlConnection
from util.helper_funcoes import HelperFuncoes


# ========================================
# Funções da aplicação
# ========================================
def importar_dados_cnae():
    """Importa dados de municípios disponibilizados a partir da API do IBGE"""

    # str_url = 'https://servicodados.ibge.gov.br/api/v2/cnae/subclasses/4723700'
    # str_url = 'https://servicodados.ibge.gov.br/api/v2/cnae/subclasses/1610204'
    str_url = 'https://servicodados.ibge.gov.br/api/v2/cnae/subclasses/'

    data = UtilURL.json_load_from_url_gzipped(str_url)
    config = PostgreSqlConfig('postgresql-db_ibge')
    conn = PostgreSqlConnection(config)
    conn.truncate_table('staging.cnae_subclasses')

    obj_list = []

    for dado in data:
        for atividade in dado['atividades']:
            obj_list.append(
                (
                    dado['id'],
                    dado['descricao'],
                    dado['classe']['id'],
                    dado['classe']['descricao'],
                    dado['classe']['grupo']['id'],
                    dado['classe']['grupo']['descricao'],
                    dado['classe']['grupo']['divisao']['id'],
                    dado['classe']['grupo']['divisao']['descricao'],
                    dado['classe']['grupo']['divisao']['secao']['id'],
                    dado['classe']['grupo']['divisao']['secao']['descricao'],
                    atividade
                )
            )

    conn.insert_list(
        'insert into staging.cnae_subclasses values (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)',
        obj_list
    )


if __name__ == '__main__':
    HelperFuncoes.exec_funcao(importar_dados_cnae)
