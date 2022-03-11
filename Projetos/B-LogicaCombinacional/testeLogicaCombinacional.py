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


class tstLogiComb(object):
    def __init__(self):
        self.pwd = os.path.dirname(os.path.abspath(__file__))
        self.rtl = os.path.join(self.pwd,'src/')
        self.tst = os.path.join(self.pwd,'')
        self.log = os.path.join(TOOL_PATH,'log','logB.xml')
        self.work = vhdlScript(self.log)

    def addSrc(self, work):
        work.addSrc(self.rtl)

    def addTst(self, work):
        if work.addTstConfigFile(self.tst) is False:
            sys.exit(1)

    def add(self, work):
        self.addSrc(work)
        self.addTst(work)

    def head(self):
        logLogiComb("---------- Logica-Combinacional   ")


if __name__ == "__main__":
    noti = notificacao('Teste projeto B')
    tstLogiComb = tstLogiComb()
    tstLogiComb.add(tstLogiComb.work)
    if tstLogiComb.work.run() == -1:
        noti.error('\n Erro de compilação VHDL')
        sys.exit(-1)

    print("===================================================")
    r = report(tstLogiComb.log, 'B', 'HW')

    #print("Reporting test result to server")
    #noti.hw(r)
    #r.send()
    #sys.exit(r.error)
    #print("===================================================")
