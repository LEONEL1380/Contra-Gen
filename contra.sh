#!/bin/bash

echo -e "\e[
░██████╗░███████╗███╗░░██╗
██╔════╝░██╔════╝████╗░██║
██║░░██╗░█████╗░░██╔██╗██║
██║░░╚██╗██╔══╝░░██║╚████║
╚██████╔╝███████╗██║░╚███║
░╚═════╝░╚══════╝╚═╝░░╚══╝

░█████╗░░█████╗░███╗░░██╗████████╗██████╗░░█████╗░░██████╗
██╔══██╗██╔══██╗████╗░██║╚══██╔══╝██╔══██╗██╔══██╗██╔════╝
██║░░╚═╝██║░░██║██╔██╗██║░░░██║░░░██████╔╝███████║╚█████╗░
██║░░██╗██║░░██║██║╚████║░░░██║░░░██╔══██╗██╔══██║░╚═══██╗
╚█████╔╝╚█████╔╝██║░╚███║░░░██║░░░██║░░██║██║░░██║██████╔╝
░╚════╝░░╚════╝░╚═╝░░╚══╝░░░╚═╝░░░╚═╝░░╚═╝╚═╝░░╚═╝╚═════╝░\e[0m"

echo -e "\e[31mGENERADOR DE CONTRASEÑA LEONEL\e[0m"

# Comprobamos si se especificó un número de contraseñas a generar
if [ -z $1 ]; then
    echo "Uso: $0 [número de contraseñas a generar]"
    exit 1
fi

# Directorio en la tarjeta SD para guardar las contraseñas
output_dir="/sdcard/contraseñas"

# Creamos el directorio si no existe
if [ ! -d $output_dir ]; then
    mkdir -p $output_dir
fi

# Generamos el número de contraseñas especificado
for ((i=0; i<$1; i++))
do
    password=$(openssl rand -base64 12 | tr -dc 'a-zA-Z0-9$!%&' | head -c 10)
    filename="$output_dir/contraseña_$i.txt"
    echo $password > $filename
done

echo "Contraseñas generadas y guardadas en $output_dir"