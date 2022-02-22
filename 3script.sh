#!/bin/bash

clear ; read  -t 5  -p "PASSO 1: INSTALAR O BIND ------> apt install bind9                        " ;

apt install bind9 ;                       

clear ; read  -t 5  -p "PASSO 2: INCLUIR AS ZONAS DIRETAS E REVERSAS NO ARQUIVO named.conf                " ;

cp /etc/bind/named.conf /etc/bind/named.conf.bkp ; cat namedconf.txt >> /etc/bind/named.conf;

clear ; read  -t 5  -p "PASSO 3: CRIAR O ARQUIVO DE ZONA DIRETA " ;

cat dbedilton.txt >> /etc/bind/db.edilton.gov.br

clear ; read  -t 5  -p "PASSO 4:  CRIAR O ARQUIVO DE ZONA REVERSA        " ;

cat db10edilton.txt >> /etc/bind/db.10

clear ; read  -t 5  -p "PASSO 5:  CONFIGURAR O ARQUIVO resolv.conf    " ;

echo "nameserver 192.168.1.15" > /etc/resolv.conf
echo "domain edilton.gov.br" >> /etc/resolv.conf ; 
echo "search edilton.gov.br" >> /etc/resolv.conf ; 

clear ; read  -t 5  -p "PASSO 6: VERIFICA O STATUS DO BIND   " ;

/etc/init.d/bind9 status; read -p "";

clear ; read  -t 5  -p "PASSO 7: REINICIAR O BIND COM AS ALTERACOES " ;

/etc/init.d/bind9 restart; read -p "";

clear ; read  -t 5  -p "PASSO 8: CHECAR AS CONFIGURACOES COM NSLOOKUP " ;

nslookup www.edilton.gov.br;   read -p "" ;

clear ; read  -t 5  -p "PASSO 9 REALIZAR O PING PARA O DOMINIO CRIADO:  " ;

ping www.edilton.gov.br;  


clear ; read  -t 5  -p "MISSAO CUMPRIDA !!!" ;


clear;
