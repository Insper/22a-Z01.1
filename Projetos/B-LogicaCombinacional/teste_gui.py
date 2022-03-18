#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# Curso de Elementos de Sistemas
# Desenvolvido por: Renan Trevisoli <renantd@insper.edu.br>
#
# Data de criação: 01/2022


######################################################################
# Tools
######################################################################
import os.path 
import sys
from pathlib import Path

pwd = os.path.dirname(os.path.abspath(__file__))
rtl = os.path.join(pwd,'src/')
tst = os.path.join(pwd,'tmp/')
gui = os.path.join(pwd,'VHDL-gui/')
proj = os.path.dirname(pwd)

sys.path.insert(0, str(gui) )
import vhdl_gui

if not os.path.isdir(tst):
    os.makedirs(tst) 
    
print("===================================================")
print("Starting GUI")

if len(sys.argv) < 2:
    print("Wrong number of arguments!")
else:
    vhdl_gui.run(sys.argv[1],rtl,tst,proj)


print("===================================================")
