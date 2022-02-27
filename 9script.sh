#!/bin/bash

clear ; read  -t 5  -p "PASSO 1: INSTALAR O SQUID      " ;

apt install squid;

clear ; read  -t 5  -p "PASSO 2: FAZER BACKUP DO ARQUIVO DE CONFIGURACAO ORIGINAL DO SQUID              " ;

nano /etc/squid/squid.conf; 

mv /etc/squid/squid.conf /etc/squid/squid.conf.bckp;

clear ; read  -t 5  -p "PASSO 3: EXPORTAR O MEU ARQUIVO DE CONFIGURACAO DO SQUID  " ;

cat confsquid.txt | less ; 

cat confsquid.txt > /etc/squid/squid.conf;

clear ; read  -t 5  -p "PASSO 4: CADASTRAR SITES PARA SEREM BLOQUEADOS EM /etc/squid/bloqueados.txt          " ;

nano /etc/squid/bloqueados.txt; 

clear ; read  -t 5  -p "PASSO 5: CRIAR PASTAS PARA OS ARQUIVOS DE CACHE E LOG     " ;

mkdir /var/cache/squid; touch /var/log/squid/store.log;

clear ; read  -t 5  -p "PASSO 6: DEFINIR PERMISSAO DO USUARIO PARA AS PASTAS DO SQUID  " ;

chown -R proxy.proxy /var/log/squid;
chown -R proxy.proxy /var/cache/squid;

clear ; read  -t 5  -p "PASSO 7: CHECAR AS CONFIGURACOES REALIZADAS COM O COMANDO squid -z " ;

squid -z;

read  -t 5  -p "PASSO 8: LIMPAR AS REGRAS DE FIREWALL DO IPTABLES " ;

iptables -t nat -F;
echo 0 > /proc/sys/net/ipv4/ip_forward;

clear ; read  -t 5  -p "PASSO 9: REINICIAR SQUID " ;

/etc/init.d/squid restart;

clear ; read  -t 5  -p "PASSO 10: CHECAR O PROXY NO NAVEGADOR " ;


clear;
