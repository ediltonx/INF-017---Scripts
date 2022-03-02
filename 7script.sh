#!/bin/bash

clear ; read    -p "PASSO 1: INSTALAR O PROGRAMA USANDO APTITUDE OU APT                       " ;

apt -y install vsftpd ftp;

clear ; read    -p "PASSO 2: ENTRAR NO PROGRAMA EM, MODO ANONIMO E REALIZAR PESQUISA              " ;

echo "username = anonymous , sem senha";

nano  /etc/vsftpd.conf;

read   -p "PASSO 3: ALTERAR AS CONFIGURACOES DO SERVIDOR, PROIBINDO MODO ANONIMO" ;

sed -i "s/anonymous_enable=YES/anonymous_enable=NO/g"  /etc/vsftpd.conf;

clear ; read   -p "PASSO 4: REINICIAR SERVIDOR E TESTAR MODO ANONIMO MAIS UMA VEZ        " ;

service vsftpd restart ;

read  -p "PASSO 5: CRIAR USUARIOS E GRUPOS PARA ACESSAR O SERVIDOR FTP    " ;

cp /etc/vsftpd.conf  /etc/vsftpd.conf.bkp;

## vesões mais novas vem assim por default sed -i "s/#local_enable=YES/local_enable=YES/g" /etc/vsftpd.conf;

groupadd ftpusers;

useradd -g ftpusers ftpuser;

passwd ftpuser;

read  -p "PASSO 6: CRIAR PASTA PARA O USUARIO 'FTPUSER' TER ACESSO AO SERVIDOR  " ;

cd /home/;

mkdir ftpuser;

chown ftpuser:ftpusers ftpuser;

chmod a-w ftpuser;

clear ; read  -p "PASSO 7:CRIAR PASTA PUBLICA COM ACESSO TOTAL  " ;

mkdir /home/ftpuser/public;
chown ftpuser:ftpusers /home/ftpuser/public;


clear ; read  -p "PASSO 8: ATIVAR MODO PASSIVO E ACESSO SOMENTE A PROPRIA PASTA  " ;

sed -i "s/#chroot_local_user=YES/chroot_local_user=YES/g" /etc/vsftpd.conf;

echo "pasv_enable=YES" >> /etc/vsftpd.conf;

clear ; read  -p "PASSO 9: MOSTRAR FUNCIONAMENTO DAS ATIVIDADES DE LEITURA E TRANSFERENCIA DE ARQUIVOS  " ;

clear;

