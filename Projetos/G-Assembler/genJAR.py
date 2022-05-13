#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# Rafael Corsi @ insper.edu.br
# Dez/2017
# Disciplina Elementos de Sistemas
#
from os.path import join, dirname
import sys
import os
import shutil
import subprocess
import argparse

import sys, subprocess
from pathlib import Path

sys.path.insert(0, str(Path.home()) + '/Z01-Tools/scripts/')
from config import *

# Scripts python

from report import report

reports = ['logJCode.txt', 'logJParser.txt', 'logJSymbolTable.txt']


def assemblerReport(r ,path):
    print("==== Results ============================")
    for filename in reports:
        try:
            r.java(path+filename)
        except IOError:
            print('Error : Arquivo não encontrado: {}'.format(filename))
    return(r.error)

def clearAssemblerReport(path):
    for filename in reports:
        try:
             os.remove(path+filename)
        except:
            pass


def genJAR(f):
    print("==== gerando jar ====================================")
    clearAssemblerReport(f)
    os.system("mvn -f {} package -q -e".format(f))


if __name__ == "__main__":
    f = os.path.join(os.path.abspath(os.path.dirname(__file__)), 'Assembler/')
    genJAR(f)
    r = report('', 'H', 'JAVA')
    assemblerReport(r, f)
    print("==== Reporting results =========================")
    #r.send()
