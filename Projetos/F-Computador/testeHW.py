#!/usr/bin/env python3
# -*- coding: utf-8 -*-

######################################################################
# Tools
######################################################################
from os.path import join, dirname
import sys
from pathlib import Path

sys.path.insert(0, str(Path.home()) + '/Z01-Tools/scripts/')
from config import *

class tstHW(object):

    def __init__(self):
        self.pwd = os.path.dirname(os.path.abspath(__file__))
        self.rtl = os.path.join(self.pwd, 'src/')
        self.tst = os.path.join(self.pwd,'')
        self.log = os.path.join(TOOL_PATH,'log','logF.xml')
        self.work = vhdlScript(self.log)

    def addSrc(self, work):
        work.addSrc(self.rtl)
        work.addSrcFile(self.rtl+'Dispositivos/RAM/RAM16K.vho')
        work.addSrcFile(self.rtl+'Dispositivos/Screen/Screen.vho')

    def addTst(self, work):
        if work.addTstConfigFile(self.tst) is False:
            sys.exit(-1)

    def add(self, work):
        self.addSrc(work)
        self.addTst(work)

if __name__ == "__main__":

    # inicializa notificacao
    noti = notificacao(PROJ_F_NAME)

    # Init ALU
    tstCpu = tstHW()
    tstLogiComb = tstLogiComb()
    tstUla = tstUla()
    tstSeq = tstLogiSeq()

    tstCpu.addSrc(tstCpu.work)
    tstUla.addSrc(tstCpu.work)
    tstLogiComb.addSrc(tstCpu.work)
    tstSeq.addSrc(tstCpu.work)
    tstCpu.add(tstCpu.work)
    if tstCpu.work.run() < 0:
        noti.error('\n Erro de compilação VHDL')
        sys.exit(-1)

    print("===================================================")
    r = report(tstCpu.log, 'F', 'HW')

    # notificacao / log do teste
    noti.hw(r)

    #print("Reporting test result to server")
    #r.send()
    sys.exit(r.error)
    print("===================================================")
