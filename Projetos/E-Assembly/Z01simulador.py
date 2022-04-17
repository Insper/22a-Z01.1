#!/usr/bin/env python3
# -*- coding: utf-8 -*-
######################################################################
# Tools
######################################################################
from os.path import join, dirname
import sys, subprocess, os
from pathlib import Path

sys.path.insert(0, str(Path.home()) + '/Z01-Tools/scripts/')
from config import *

if __name__ == "__main__":
    root = os.getcwd()
    os.chdir(Z01_GUI_PATH)

    # tenta detectar a versão do python do sistema
    # se python2 for a padrão, forca a execucao
    # com python 3
    os.system('python3 main.py')
