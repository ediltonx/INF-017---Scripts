#!/bin/bash

clear ; read  -t 5  -p "PASSO 1: ALTERAR O IP PARA O VALOR DO SERVIDOR APACHE" ;

nano /etc/bind/db.edilton.gov.br ;
nano /etc/bind/db.edilton.org ;

clear ; read  -t 5  -p "PASSO 2: REINICIAR O BIND COM AS ALTERACOES " ;

service bind9 reload;

service bind9 restart; 

clear;
