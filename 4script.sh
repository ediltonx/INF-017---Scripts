#!/bin/bash

ifconfig enp0s3 | grep 'inet' ; read -p "Antes de comecar, digite o ipv4 encontrado: " ipv4;


clear ; read  -t 5  -p "PASSO 1: CRIAR DIRETORIOS EM /var/www  USANDO MKDIR               " ;

mkdir /var/www/html/edilton.gov ; mkdir /var/www/html/edilton.org ;

clear;

read  -t 1  -p "PASSO 2: ADICIONAR UM ARQUIVO INDEX.HTML NOS DIRETORIOS CRIADOS              " ;

echo "<html><h1> Site de Edilton ponto GOV ponto BR </h1></html>" > /var/www/html/edilton.gov/index.html ;
echo "<html><h1> Site de Edilton dot ORG </h1></html>" > /var/www/html/edilton.org/index.html ;

read  -t 5  -p "";

clear ; read  -t 5  -p "PASSO 3: CRIAR OS ARQUIVOS DE CONFIGURACAO DOS SITES EM /etc/apache2/sites-available " ;

echo "

#
#
<VirtualHost *>

        ServerAdmin webmaster@www.edilton.gov.br
        ServerName  www.edilton.gov.br
        ServerAlias edilton.gov.br

        # Indexes + Directory Root.
        DirectoryIndex index.html
        DocumentRoot /home/www/html/edilton.gov

</VirtualHost>


" > /etc/apache2/sites-available/www.edilton.gov.br.conf ;


echo "

#
#
<VirtualHost *>

        ServerAdmin webmaster@www.edilton.org
        ServerName  www.edilton.org
        ServerAlias www.edilton.org

        # Indexes + Directory Root.
        DirectoryIndex index.html
        DocumentRoot /home/www/html/www.edilton.org

</VirtualHost>


" > /etc/apache2/sites-available/www.edilton.org.conf ;

printf  "\nOs arquivos .conf das paginas foram configurados nos respectivos diretorios:\n\n";

ls -d  /etc/apache2/sites-available/*.conf;

read  -t 5 -p "";

clear ; read  -t 5  -p "PASSO 4: HABILITAR OS SITES E VERIFICAR SE FORAM HABILITADOS    " ;

cd /etc/apache2/sites-available/ ; a2ensite www.edilton.org ; a2ensite www.edilton.gov.br ;

ls /etc/apache2/sites-enabled/ ;

read  -t 5  -p "PASSO 5: REATIVAR O SERVIDOR DO APACHE   " ;

/etc/init.d/apache2 reload ; read -t 1 -p""; 

service apache2 stop; read -t 1 -p "";

service apache2 start;

read  -t 5  -p "PASSO 6: CHECAR OS SITES NO NAVEGADOR   " ;

elinks $ipv4/edilton.gov;

elinks $ipv4/edilton.org;

clear; read   -p " MISSAO CUMPRIDA !!!  " ;

clear ; read  -t 5  -p "FIM" ;


clear ;
 
