#!/usr/bin/env python3
# -*- coding: utf-8 -*-
######################################################################
# Tools
######################################################################
import os
import sys, subprocess, time
from pathlib import Path
sys.path.insert(0, str(Path.home()) + '/Z01-Tools/scripts/')
from config import *

if __name__ == "__main__":
    print("------------------ Programando FPGA - ULA")
    noti = notificacao("C-ULA\n")

    if writeSOF(CDF_ULA_PATH):
        noti.error("FPGA NAO PROGRAMADA!")
        sys.exit(ERRO_PROGRAMING)
    noti.ok("FPGA programada!")
    print('------------------- Concluido')
