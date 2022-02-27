#!/bin/bash

clear ; read  -t 5  -p "PASSO 1: INSTALAR O OPENSSH SERVER        " ;

apt install openssh-server ; 

clear ; read  -t 5  -p "PASSO 2: CONFIGURAR PARÂMETROS DO HOST     " ;

nano  /etc/ssh/sshd_config;
nano /etc/ssh/ssh_config ; 

clear ; read  -t 5  -p "PASSO 3: ATIVAR O SERVIDOR SSH NA MÁQUINA DESEJADA  " ;

service ssh start ; service ssh restart ;

clear ; read  -t 5  -p "PASSO 4: CONFIGURAR PARÂMETROS NO CLIENTE E AGUARDAR CONEXÃO NO IP ABAIXO    " ;
ifconfig | grep "inet";




