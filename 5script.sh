clear ; read  -t 5  -p "PASSO 1: VERIFICAR ENDERECOS IP NA PASTA DO BIND 9                      " ;

cat /etc/bind/db.edilton.gov.br;

cat /etc/bind/db.edilton.org;

read  -t 5  -p "PASSO 2: MUDAR UM DOS IPS      " ;

nano /etc/bind/db.edilton.org;
nano /etc/bind/db.ediltongov.br;

clear ; read  -t 5  -p "PASSO 3: ALTERA O ENDERECO DE IP DE UM DOS SITES EM /etc/apache2/sites-available " ;

<<comentario

<VirtualHost ESSE ENDERECO AQUI QUE TEM QUE MUDAR PRA FICAR IGUAL AO OUTRO>
        ServerAdmin webmaster@www.edilton.gov.br
        ServerName  www.edilton.gov.br
        ServerAlias edilton.gov.br

        # Indexes + Directory Root.
        DirectoryIndex index.html
        DocumentRoot /home/www/edilton.gov.br

</VirtualHost>


comentario


clear ; read  -t 5  -p "PASSO 4: REINICIAR OS DOIS SERVICOS          " ;

/etc/init.d/bind9 reload ;
/etc/init.d/apache2 reload ;

read  -t 5  -p "PASSO 5: VERIFICAR COM O COMANDO PING e E NSLOOKUP    " ;

ping www.edilton.gov.br ;
ping www.edilton.org ; clear ;

nslookup www.edilton.gov.br ; 
nslookup www.edilton.org ;

read  -t 5  -p " MISSAO CUMPRIDA !!!  " ;

clear ; read  -t 5  -p "FIM" ;


clear ;
