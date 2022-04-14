# -*- coding: utf-8 -*-
"""
Created on Thu Jan 20 10:30:14 2022

@author: Renan Trevisoli
"""
import os
import sys
import glob

class vhdl_runner:
    
    def __init__(self, filename, path_in, path_out, path_proj):
        
        self.filename = filename
        self.path_in = path_in
        self.path_out = path_out
        self.path_proj = path_proj
        try:
            file = open(path_in+filename,'r')
            self.lines = file.readlines()
            file.close()
        except (FileNotFoundError, IOError):
            print('Wrong file name or path')
            sys.exit()
            
    def read_variables(self):
        variables = []
        types= []
        lengths = []

        entity = False
        for i in range(len(self.lines)):
            # check for comments
            if self.lines[i].find("--") != -1:
                actual_line = self.lines[i][: self.lines[i].find("--") ]
            else:
                actual_line = self.lines[i]   
            
            # check start of entity
            if "entity" and 'is' in actual_line:
               entity = True           
            elif "end entity;" in actual_line:
                break
            
            # identify variables
            if entity:
                var_len = 0
                var_type = ''
                if ":" in actual_line:
                    # check length
                    if ("STD_LOGIC_VECTOR" in actual_line) or ("std_logic_vector" in actual_line):
                        if "downto" in actual_line:
                            var_len =  int(actual_line[actual_line.find("(")+1:actual_line.find("downto")]) - int(actual_line[actual_line.find("downto")+6:actual_line.find(")")]) +1
                        else:
                            var_len =  int(actual_line[actual_line.find("(")+1:actual_line.find("DOWNTO")]) - int(actual_line[actual_line.find("DOWNTO")+6:actual_line.find(")")]) +1
                    elif ("STD_LOGIC" in actual_line) or ("std_logic" in actual_line):
                        var_len = 1                       
                    else:
                        raise Exception("Data length not identified")
                    
                    # check type
                    if " in " in actual_line:
                        var_type = "in"
                    elif " out " in actual_line:
                        var_type = "out"                       
                    else:
                        raise Exception("Data type not identified")
                    
                    actual_line = actual_line.split(":")[0]
                    actual_line = actual_line.replace(","," ")
                    actual_line = actual_line.split()
                    for j in range(len(actual_line)):
                        variables.append(actual_line[j])
                        types.append(var_type)
                        lengths.append(var_len)
        return variables, types, lengths
        
    def write_test(self,inputs):
        variables, types, lengths = self.read_variables()
        signals =[]
        
        if types.count('in')!=len(inputs):
            raise ValueError('Different numbers of variables!')
        
        for i in range(len(variables)):
            signals.append(types[i] + "_" + variables[i])
            
        file = open(self.path_out + "tb_" + self.filename,'w')
        try:        
            file.write("-- Generated automatically by vhdl_sim\n")
            file.write("-- developed by Renan Trevisoli\n")
            # headers
            file.write("library ieee;\n")
            file.write("use ieee.STD_LOGIC_1164.all;\n")
            file.write("use ieee.numeric_std.all;\n\n")
            
            # entity
            file.write("entity " + "tb_" + self.filename[:-4] +" is\n")
            file.write("end entity;\n\n")
    
            # architecture
            file.write("architecture tb of " + "tb_" + self.filename[:-4] +" is\n")
            file.write("\tcomponent " + self.filename[:-4] +" is\n")
            file.write("\tport (\n")
            
            for i in range(len(variables)-1):            
                if lengths[i] > 1:
                    file.write("\t" + variables[i] + ": " + types[i] + " STD_LOGIC_VECTOR(" + str(lengths[i]-1) + " downto 0);\n")
                elif lengths[i] == 1:
                    file.write("\t" + variables[i] + ": " + types[i] + " STD_LOGIC;\n")  
            i += 1 
            if lengths[i] > 1:
                file.write("\t" + variables[i] + ": " + types[i] + " STD_LOGIC_VECTOR(" + str(lengths[i]-1) + " downto 0)\n")
            elif lengths[i] == 1:
                file.write("\t" + variables[i] + ": " + types[i] + " STD_LOGIC\n")  
                
            file.write("\t" + ");\n")
            file.write("\t" + "end component;\n\n")      
            
            # signals
    
            for i in range(len(variables)):            
                if lengths[i] > 1:
                    file.write("\t" + "signal " + signals[i] + ": " + " STD_LOGIC_VECTOR(" + str(lengths[i]-1) + " downto 0);\n")
                elif lengths[i] == 1:
                    file.write("\t" + "signal " + signals[i] + ": " + " STD_LOGIC;\n")           
    
            #
            file.write("begin\n")


            file.write("\t" + "u" + self.filename[:-4] + " : " + self.filename[:-4] + " port map(" + ",".join(signals) + ");\n" )
            
            for i in range(len(variables)):
                if types[i] == "in":
                    if lengths[i] > 1:
                        file.write("\t" + types[i] + "_" + variables[i] + " <= \"" + inputs[i] +"\";\n")
                    elif lengths[i] == 1:
                        file.write("\t" + types[i] + "_" + variables[i] + " <= \'" + inputs[i] +"\';\n")
            
            file.write("end architecture;\n")
        except:            
            print('Error while generating the file!')   
            
        file.close()    
        
        return 0
    
    def read_results(self):
        variables = []
        variables_symbol = []
        values = []
        
        filename = self.filename[:-4] + ".vcd"
        try:
            file = open(self.path_out + filename,'r')
            result_lines = file.readlines()
            file.close()
        except (FileNotFoundError, IOError):
            print('Results file not found!')
            sys.exit()
        
        for i in range(len(result_lines)):
            # check for output variables
            if ("$var" in result_lines[i])  and ("out_" in result_lines[i]):
                actual_line = result_lines[i].split()
                variables_symbol.append(actual_line[3])
                if "[" in actual_line[4]:
                    variables.append(actual_line[4][:actual_line[4].find("[") ])
                else:
                    variables.append(actual_line[4][:])
                values.append("")
            elif "#0" in result_lines[i]:
                break
        
        for j in range(i+1,len(result_lines)):
            for k in range(len(variables_symbol)):
                if result_lines[j].startswith('b'):
                    actual_line = result_lines[j].split()
                    if variables_symbol[k] == actual_line[1]:
                        values[k] = actual_line[0][1:]
                else:
                    actual_line = [result_lines[j][0],result_lines[j][1:-1]]
                    if variables_symbol[k] == actual_line[1]:
                        values[k] = actual_line[0]
                    #print(values[k] + "  " + actual_line[1] )     
               
        return variables, values    

    def run(self):
        os.system('ghdl -a ' + self.path_in + self.filename)
        os.system('ghdl -e ' + self.filename[:-4])

        os.system('ghdl -a ' + self.path_out + 'tb_' + self.filename)
        os.system('ghdl -e ' + 'tb_' + self.filename[:-4])

        os.system('ghdl -r ' + 'tb_' + self.filename[:-4] + ' --wave=' + self.path_out + self.filename[:-4] + '.ghw --vcd=' + self.path_out + self.filename[:-4] + '.vcd --stop-time=100ns')

        return "Done"

    def run_all(self):
        folders = os.listdir(self.path_proj + "/")
        for i in range(len(folders)):
            files = glob.glob(self.path_proj + "/" + folders[i] + "/src/*.vhd")
            for j in range(len(files)):                
                os.system('ghdl -a --ieee=synopsys -fexplicit ' + files[j])
                os.system('ghdl -e --ieee=synopsys -fexplicit ' + files[j][len(self.path_proj + "/" + folders[i] + "/src/" ):-4])

        return "Done"
