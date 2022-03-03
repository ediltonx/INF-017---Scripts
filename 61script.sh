#!/bin/bash

clear ; read  -t 5  -p "PASSO 1: ALTERAR O IP DO NAMESERVER E DO ARQUIVO DE VIRTUALHOST" ;

echo "nameserver 192.168.1.14"  > /etc/resolv.conf;

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

read  -t 5  -p "PASSO 5: REATIVAR O SERVIDOR DO APACHE   " ;

/etc/init.d/apache2 reload ; read -t 1 -p""; 

service apache2 stop; read -t 1 -p "";

service apache2 start;

clear ; read  -t 5  -p "FIM" ;


clear ;
 
