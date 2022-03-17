#!/bin/bash

clear ; read  -t 5  -p "PASSO 1: INSTALAR O SERVIDOR DHCP                        " ;

apt install isc-dhcp-server -yqq ;

clear ; read  -t 5  -p "PASSO 2: CONFIGURAR INTERFACE DE REDE CONFERINDO SE ESTA FUNCIONANDO               " ;

ifconfig enp0s3 10.20.20.1 netmask 255.255.255.255 up;

ifconfig -a | grep inet ;

read  -t 5  -p "" ;


clear ; read  -t 5  -p "PASSO 3: CONFIGURAR SERVIDOR COMO GATEWAY E VERIFICAR A ROTA " ;

route add default gw 10.20.20.1 enp0s3;

route -n;

read  -t 5  -p "" ;


clear ; read  -t 5  -p "PASSO 4: CONFIGURAR PARAMETROS DA SUB-REDE EM /ETC/DHCP/dchpd.conf";

echo '
subnet 10.20.20.0 netmask 255.255.255.0 {
range 10.20.20.50 10.20.20.150;
option domain-name-servers 10.20.20.1;
option domain-name "edilton.internal";
option routers 10.20.20.1;
option subnet-mask 255.255.255.0;
option broadcast-address 10.20.20.255;
default-lease-time 600;
max-lease-time 7200;
}

' >> /etc/dhcp/dhcpd.conf ;
 
echo "authoritative;" >> /etc/dhcp/dhcpd.conf ;

clear ; read  -t 5  -p "PASSO 5: ADICIONAR INTERFACE NO ARQUIVO isc-dhcp-server " ;

echo 'INTERFACESv4="enp0s3"' > /etc/default/isc-dhcp-server ;

clear ; read  -t 5  -p "PASSO 6: REINICIAR SERVIDOR " ;

/etc/init.d/isc-dhcp-server restart;
/etc/init.d/isc-dhcp-server status;


