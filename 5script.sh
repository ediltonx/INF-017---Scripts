#!/bin/bash

clear ; read  -t 5  -p "PASSO 1: ADICIONAR OS MESMOS NUMEROS DE IP NOS ARQUIVOS DE CONFIGURAÇÃO DO BIND   " ;

nano /etc/bind/db.edilton.gov.br ;
nano /etc/bind/db.edilton.org ;

clear;

read  -t 5  -p "PASSO 2: ADICIONAR O MESMO IP NOS ARQUIVOS DO APACHE          " ;

nano /etc/apache2/sites-available/www.edilton.gov.br.conf;
nano /etc/apache2/sites-available/www.edilton.org.conf;

clear ; read  -t 5  -p "PASSO 3: REINICIAR OS SERVIÇOS " ;

service bind9 reload;

service bind9 restart;

service apache2 reload;

service apache2 stop;

service apache2 start;

read  -t 5  -p "PASSO 6: CHECAR O FUNCIONAMENTO DOS SITES   " ;

ping www.edilton.gov.br;

ping www.edilton.org;

clear; read   -p " MISSAO CUMPRIDA !!!  " ;

clear ; read  -t 5  -p "FIM" ;


clear ;
 
