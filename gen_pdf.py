#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# Rafael Corsi @ insper.edu.br

import subprocess
import os

for filename in os.listdir('.'):
    if filename.find('Exercicio') > -1 and filename.find('.md') > -1:
        print("Processing:  " + filename)
        subprocess.run(["insper_handout.py", filename, "--output", "../Exercicios/"+filename[:-3]])


