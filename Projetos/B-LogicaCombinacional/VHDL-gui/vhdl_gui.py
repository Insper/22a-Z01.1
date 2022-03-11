# -*- coding: utf-8 -*-
"""
Created on Mon Jan 17 17:19:50 2022

@author: Renan Trevisoli
"""

import pygame
import subprocess
import vhdl_sim as sim
import sys
from pathlib import Path


def run(nome,path_in,path_out,path_proj):
    #nome = 'And16'
    if nome.endswith(".vhd"):
        nome = nome[:-4]

    circ = sim.vhdl_runner(nome+'.vhd',path_in,path_out,path_proj)
    circ.run_all() 

    variaveis,tipos,comprimentos = circ.read_variables()
    valores = []

    n_in = tipos.count('in')
    n_out = tipos.count('out')

    pygame.init()
    font = pygame.font.SysFont('Comic Sans MS', 30)

    background_colour = (0,100,0)
    white = (255,255,255)
    blue = (0,0,255)
    black = (0,0,0)
    width_box = 300
    width_ext = max(comprimentos)*2*20 + len(max(variaveis, key=len))*2*18
    height_box = max(n_in,n_out)*40
    height_ext = 100
    (width, height) = ( width_box + width_ext, height_box + height_ext )


    screen = pygame.display.set_mode((width, height))
    pygame.display.set_caption(nome)
    icon = pygame.image.load(str(Path.home()) + '/Z01-Tools/VHDL-gui/icon-elementos.png')
    pygame.display.set_icon(icon)
    screen.fill(background_colour)


    pygame.draw.rect(screen, black, pygame.Rect(int(width/2)-int(width_box/2), int(height_ext/2), width_box, height_box ),  2)


    #pygame.draw.circle(screen, blue, (10,10), 5)

    textsurface = font.render(nome, True, (0, 0, 0))
    text_rect = textsurface.get_rect()
    text_rect.center = (int(width/2),int(height/2))
    screen.blit(textsurface, text_rect )



    # entradas e saídas

    n_in_n = 0
    n_out_n = 0
    y_in = ( height_ext/2 - (height_box)/(2*n_in))
    y_out = ( height_ext/2 - (height_box)/(2*n_out))
    limites_x = []
    limites_y = []
    variavel_pos = []
    x_res = []
    y_res = []
    variavel_pos_res = []

    for i in range(len(variaveis)):
        valores.append(list('0'*comprimentos[i]))
        
        if tipos[i] == 'in':
            y_in += ( (height_box)/n_in )
            
            x_in = int(width/2)-int(width_box/2) - 10
            for j in range(comprimentos[i]):
                pygame.draw.circle(screen, white, ( int(x_in),int(y_in) ), 8)
                limites_x.append([int(x_in)-4,int(x_in)+4])
                limites_y.append([int(y_in)-4,int(y_in)+4])
                variavel_pos.append([i,j])
                x_in -= 20
                
            textsurface = font.render(variaveis[i], True, (0, 0, 0))
            text_rect = textsurface.get_rect()
            text_rect.midleft  = (5,int(y_in))
            screen.blit(textsurface, text_rect )
        else:
            y_out += ( (height_box)/n_out )
            
            x_out = int(width/2)+int(width_box/2) - 10 + comprimentos[i]*20
            for j in range(comprimentos[i]):
                pygame.draw.circle(screen, white, ( int(x_out),int(y_out) ), 8)
                x_res.append(x_out)
                y_res.append(y_out)
                variavel_pos_res.append([i,j])
                x_out -= 20
                
            textsurface = font.render(variaveis[i], True, (0, 0, 0))
            text_rect = textsurface.get_rect()
            text_rect.midright  = (width-5,int(y_out))
            screen.blit(textsurface, text_rect )
            
    # initial values
    input_list = []
    for m in range(len(variaveis)):
        if tipos[m] == 'in':
            string = "".join(valores[m])
            input_list.append(string[::-1])
    circ.write_test(input_list)
    circ.run()   
    variables_res, values_res = circ.read_results()
    
    for m in range(len(variaveis)):
        for n in range(len(variables_res)):
            actual_var = variables_res[n][4:]
            if (variaveis[m].upper() == actual_var.upper()) :
                valores[m] = list(values_res[n][::-1])
    
    for m in range(len(variavel_pos_res)):
        if valores[variavel_pos_res[m][0]][variavel_pos_res[m][1]] == '1':
            pygame.draw.circle(screen, blue, ( x_res[m],y_res[m] ), 8)
        else:
            pygame.draw.circle(screen, white, ( x_res[m],y_res[m] ), 8)
    

    pygame.display.update()   

    running = True
    while running:
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                running = False
            elif event.type == pygame.MOUSEBUTTONDOWN:          
                x, y = event.pos
                
                for k in range(len(variavel_pos)):
                    if (limites_x[k][0] < x < limites_x[k][1]) and (limites_y[k][0] < y < limites_y[k][1]):
                        
                        if valores[variavel_pos[k][0]][variavel_pos[k][1]] == '0':
                            valores[variavel_pos[k][0]][variavel_pos[k][1]] = '1'
                            pygame.draw.circle(screen, blue, ( int((limites_x[k][0]+limites_x[k][1])/2),int((limites_y[k][0]+limites_y[k][1])/2) ), 8)
                        else:
                            valores[variavel_pos[k][0]][variavel_pos[k][1]] = '0'
                            pygame.draw.circle(screen, white, ( int((limites_x[k][0]+limites_x[k][1])/2),int((limites_y[k][0]+limites_y[k][1])/2) ), 8)               
                        
                    
                        input_list = []
                        for m in range(len(variaveis)):
                            if tipos[m] == 'in':
                                string = "".join(valores[m])
                                input_list.append(string[::-1])
                        circ.write_test(input_list)
                        circ.run()   
                        variables_res, values_res = circ.read_results()
                        
                        for m in range(len(variaveis)):
                            for n in range(len(variables_res)):
                                actual_var = variables_res[n][4:]
                                if (variaveis[m].upper() == actual_var.upper()) :
                                    valores[m] = list(values_res[n][::-1])
                        
                        for m in range(len(variavel_pos_res)):
                            if valores[variavel_pos_res[m][0]][variavel_pos_res[m][1]] == '1':
                                pygame.draw.circle(screen, blue, ( x_res[m],y_res[m] ), 8)
                            else:
                                pygame.draw.circle(screen, white, ( x_res[m],y_res[m] ), 8)

                        break	
                    
        pygame.display.update()        

    pygame.quit()


