#!/usr/bin/env python3
# -*- coding: utf-8 -*-
######################################################################
# Tools
######################################################################
from os import *
import sys, subprocess

from pathlib import Path

sys.path.insert(0, str(Path.home()) + '/Z01-Tools/scripts/')
from config import *
from assembler import *

if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-n", "--nasm", required=True, help="arquivo nasm a ser compilado e programado na FPGA")
    args = vars(ap.parse_args())

    print("------------------ Gravando nasm Z011")

    # compilando NASM -> .bin
    nasm = args["nasm"]
    pwd = os.path.dirname(os.path.abspath(__file__))
    hack = pwd+"/../bin/hack/"+os.path.splitext(os.path.basename(args["nasm"]))[0]

    # assembler
    assemblerFile(ASSEMBLER_JAR, nasm, hack, True)

    # program ROM
    writeROM(hack+".mif")
