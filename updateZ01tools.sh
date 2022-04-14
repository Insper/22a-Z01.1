#!/bin/bash

echo "----------------------------------------"
echo "         ELEMENTOS DE SISTEMAS          "
echo "----------------------------------------"

#echo "-------------------------------------------------------"
#echo "- Módulos python"
#echo "-------------------------------------------------------"
#pip3 install -r requirements.txt --user

echo "-------------------------------------------------------"
echo "- Z01 tools"
echo "-------------------------------------------------------"
Z01_PATH=$HOME/Z01-Tools/
Z01_TOOLS_URL="https://github.com/insper/Z01-tools"
if [ ! -d "$Z01_PATH" ]; then
    echo "Instalando Z01-1 tools"
else
    echo "Atualizando Z01-1 tools"
    rm -rf $Z01_PATH
fi

git clone $Z01_TOOLS_URL $Z01_PATH

wait
