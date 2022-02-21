clear ; read -p "PRIMEIRO PASSO: INSTALAR O APACHE                        " z;

apt --install-suggests --install-recommends install  apache2;

clear ; read -p "SEGUNDO PASSO: INICIAR O SERVIDOR DO APACHE2              " Z;

/etc/init.d/apache2 start;  read -t 5  -p "";

clear ; read -p "TERCEIRO PASSO: VERIFICAR O FUNCIONAMENTO DO SERVIDOR NA PORTA 80   " z;
netstat -tuplpn | grep :80 ; read -t 5 -p "";

clear ; read -p "QUARTO PASSO: VERIFICAR O ENDEREÇO DO SERVIDOR NO BROWSER           " z;
ifconfig enp0s3 | grep 'inet' ; read -p "digite o ipv4 encontrado: " p;
elinks $p"/index.html";
  
echo '<h1>Fui buscar cobre... E encontrei ouro !!!</h1>' > /var/www/html/index.html ;

read -p "Qualquer alteração no html reflete no navegador";

clear ; read -p "QUINTO PASSO: INSTALAR O PHP 5 E DEPENDÊNCIAS           " z;
aptitude install php ;

clear ; read -p "SEXTO PASSO: ACRESCENTAR O ARQUIVO INFO.PHP PARA O SERVIDOR   " z;
echo '<?php  phpinfo();  ?>' > /var/www/html/info.php;

clear ; read -p "ÚLTIMO PASSO: VERIFICAR O ARQUIVO PHP COM O BROWSER           " z;
elinks $p"/info.php"; clear;
