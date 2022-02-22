#!/bin/bash

clear ; read  -t 5  -p "PASSO 1: INSTALAR O BIND ------> apt install bind9                        " ;

apt install bind9 -y;                       

clear ; read  -t 5  -p "PASSO 2: INCLUIR AS ZONAS DIRETAS E REVERSAS NO ARQUIVO named.conf                " ;

cp /etc/bind/named.conf /etc/bind/named.conf.bkp ; cat namedconf.txt >> /etc/bind/named.conf;

clear ; read  -t 5  -p "PASSO 3: CRIAR O ARQUIVO DE ZONA DIRETA " ;

cat dbatv3.txt >> /etc/bind/db.atv3.gov.br

clear ; read  -t 5  -p "PASSO 4:  CRIAR O ARQUIVO DE ZONA REVERSA        " ;

cat db10atv3.txt >> /etc/bind/db.10

clear ; read  -t 5  -p "PASSO 5:  CONFIGURAR O ARQUIVO resolv.conf    " ;

echo "domain atv3.gov.br" >> /etc/resolv.conf ; 
echo "search atv3.gov.br" >> /etc/resolv.conf ; 
echo "192.168.1.15" >> /etc/resolv.conf ; 

clear ; read  -t 5  -p "PASSO 6: VERIFICA O STATUS DO BIND   " ;

/etc/init.d/bind9 status;

clear ; read  -t 5  -p "PASSO 7: REINICIAR O BIND COM AS ALTERACOES " ;

/etc/init.d/bind9 restart;

clear ; read  -t 5  -p "PASSO 8: CHECAR AS CONFIGURACOES COM NSLOOKUP " ;

nslookup www.atv3.gov.br;

clear ; read  -t 5  -p "PASSO 9 REALIZAR O PING PARA O DOMINIO CRIADO:  " ;

ping www.atv3.gov.br;


clear ; read  -t 5  -p "MISSAO CUMPRIDA !!!" ;


clear;
