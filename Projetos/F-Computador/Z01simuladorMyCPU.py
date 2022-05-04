#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# Rafael Corsi @ insper.edu.br
# Dez/2017
# Disciplina Elementos de Sistemas
#
# script para gerar hack a partir de nasm
# suporta como entrada um único arquivo
# ou um diretório
# Possibilita também a geração do .mif
import os
import sys, subprocess
from pathlib import Path

sys.path.insert(0, str(Path.home()) + '/Z01-Tools/scripts/')
from config import *

if __name__ == "__main__":
    dir_path = os.path.dirname(os.path.realpath(__file__))
    os.chdir(SIMULATOR_GUI_PATH)

    # tenta detectar a versão do python do sistema
    # se python2 for a padrão, forca a execucao
    # com python 3
    os.system('python3 main.py --rtl_dir=' + SIMULATOR_GUI_PATH)
