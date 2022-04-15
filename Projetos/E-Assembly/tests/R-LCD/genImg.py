#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# Curso de Elementos de Sistemas
# Desenvolvido por: Rafael Corsi <rafael.corsi@insper.edu.br>
# ref: https://solarianprogrammer.com/2017/10/25/ppm-image-python-3/

import array
from pathlib import Path
import sys, subprocess
sys.path.insert(0, str(Path.home()) + '/Z01-Tools/scripts/')
from config import *

class lcdToimg(object):
    def __init__(self, memIn, imgOut):
        self.memIn = memIn
        self.imgOut = imgOut
        self.width = 320
        self.height = 240
        self.maxval = 1
        self.ppm_header = f'P1 {self.width} {self.height} {self.maxval}\n'
        self.img = [0]*(self.width*self.height)

    def genImg(self):
        n = 0;
        with open(self.memIn, 'r') as fr:
            for line in fr:
                if line.find('//') < 0:
                    for b in line.split():
                        if(b.find(':') < 0):
                            for px in b:
                                self.img[n]=px
                                n = n+1
    def saveImg(self):
        print(self.imgOut)
        with open(self.imgOut, 'wb') as fw:
            fw.write(bytearray(self.ppm_header, 'ascii'))
            for n in self.img:
                fw.write('{} '.format(n).encode())

if __name__ == "__main__":
    lcd = lcdToimg('R-LCD0_lcd.mif', 'lcd.pgm')
    lcd.genImg()
    lcd.saveImg2()
