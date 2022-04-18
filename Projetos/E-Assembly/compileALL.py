#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# Curso de Elementos de Sistemas
# Desenvolvido por: Rafael Corsi <rafael.corsi@insper.edu.br>
#
# Adaptado de :     Pedro Cunial   <pedrocc4@al.insper.edu.br>
#                   Luciano Soares <lpsoares@insper.edu.br>
# Data de criação: 07/2017

######################################################################
# Tools
######################################################################
from os.path import join, dirname
import sys, subprocess
from pathlib import Path

sys.path.insert(0, str(Path.home()) + '/Z01-Tools/scripts/')
from config import *
from assembler import assemblerAll, clearbin, compileAll, compileAllNotify

if __name__ == "__main__":
    pwd = os.path.dirname(os.path.abspath(__file__))

    nasm = [pwd+"/src/", pwd+"/src/examples/"]
    hack = pwd+"/bin/hack/"

    print("-------------------------")
    print("-  Inicio      ")
    print("-------------------------")
    error, log = compileAll(ASSEMBLER_JAR, nasm, hack)

    if error > 0:
        print("Finalizado com erro")
    else:
        print("Finalizado sem erros de compilação")
    sys.exit(compileAllNotify(error, log))
