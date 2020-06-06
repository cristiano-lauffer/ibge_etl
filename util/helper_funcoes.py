# -*- coding: utf-8 -*-
"""
Created on 5 de junho de 2020

@author: Cristiano Serafim Lauffer
"""
from datetime import datetime


class HelperFuncoes(object):

    def __init__(self):
        pass

    @staticmethod
    def exec_funcao(funcao, **kwargs):
        str_formato_dt_hr = '%Y-%m-%d %H:%M:%S'
        str_data_hora = datetime.today().strftime(str_formato_dt_hr)
        print('[HORARIO_EXECUCAO] ' + str_data_hora + ' - [PROCESSO] ' + funcao.__name__)
        try:
            funcao(**kwargs)
        except Exception as exc:
            str_data_hora = datetime.today().strftime(str_formato_dt_hr)
            print('[HORARIO_EXECUCAO] ' + str_data_hora + ' - [ERRO] (' + funcao.__name__ + ')')
            print(exc)
