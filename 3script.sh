clear ; read -p "PRIMEIRO PASSO: INSTALAR O APACHE                        " z;

apt --install-suggests --install-recommends install  apache2;

clear ; read -p "SEGUNDO PASSO: INICIAR O SERVIDOR DO APACHE2              " Z;

/etc/init.d/apache2 start;

clear ; read -p "TERCEIRO PASSO: VERIFICAR O FUNCIONAMENTO DO SERVIDOR NA PORTA 80   " z;
netstat -tupipn | grep :80 ; read -t 5 -p "";

clear ; read -p "QUARTO PASSO: VERIFICAR O ENDEREÇO DO SERVIDOR NO BROWSER           " z;
ifconfig eth0 | grep "inet addr:" ; read -p "<--- verifique o ip no navegador"

clear ; read -p "QUINTO PASSO: INSTALAR O PHP 5 E DEPENDÊNCIAS           " z;
apitude install php5 libapache2-mod-php5;

clear ; read -p "SEXTO PASSO: ACRESCENTAR O ARQUIVO INFO.PHP PARA O SERVIDOR   " z;
echo '<?php  phpinfo():  ?>' > /var/www/info.php;

clear ; read -p "SÉTIMO PASSO: instalar o grp           " z;
clear ; read -p "OITAVO PASSO: instalar o grp           " z;
clear ; read -p "NONO PASSO: instalar o grp           " z;
clear ; read -p "DECIMO PASSO: instalar o grp           " z;
clear ; read -p "DECIMO PRIMEIRO PASSO: instalar o grp           " z;
clear ; read -p "DECIMO SEGUNDO PASSO: instalar o grp           " z;
clear ; read -p "DECIMO TERCEIRO PASSO: instalar o grp           " z;
clear ; read -p "DECIMO QUARTO PASSO: instalar o grp           " z;
clear ; read -p "DECIMO QUINTO PASSO: instalar o grp           " z;
clear;
