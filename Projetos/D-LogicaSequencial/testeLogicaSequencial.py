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

class tstLogiSeq(object):

    def __init__(self):
        self.pwd = os.path.dirname(os.path.abspath(__file__))
        self.rtl = os.path.join(self.pwd,'src/')
        self.tst = os.path.join(self.pwd,'')
        self.log = os.path.join(TOOL_PATH,'log','logD.xml')
        self.work = vhdlScript(self.log)

    def addSrc(self, work):
        work.addSrc(self.rtl)
        work.addSrc(self.rtl+'conceitoA/')

    def addTst(self, work):
        if work.addTstConfigFile(self.tst) is False:
            sys.exit(1)

    def add(self, work):
        self.addSrc(work)
        self.addTst(work)

if __name__ == "__main__":

    # inicializa notificacao
    noti = notificacao(PROJ_D_NAME)

    # Init ALU
    tstLogiSeq = tstLogiSeq()

    # Logica Combinacional RTL
    tstLogiComb = tstLogiComb()
    tstLogiComb.addSrc(tstLogiSeq.work)

    # ULA
    tstUla = tstUla()
    tstUla.addSrc(tstLogiSeq.work)

    # Logica Sequencial
    tstLogiSeq.add(tstLogiSeq.work)
    tstLogiSeq.work.run()

    print("===================================================")
    r = report(tstLogiSeq.log, 'D', 'HW')

    # notificacao / log do teste
    #noti.hw(r)

    #print("Reporting test result to server")
    r.send()
    sys.exit(r.error)
    print("===================================================")
