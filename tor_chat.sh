#!/bin/bash



apt install torsocks -y
apt install tor -y



if [ -z "$1" ]

then

echo -e "\033[1;32m Tor_Chat is encrypted chat over Tor service \n for more visit :\033[0m https://github.com/security-softwares"

echo -e "\033[1;33musage:    bash tor_chat.sh -s : For server side \n bash tor_chat.sh -c : For client side \033[0m \n bash tor_chat.sh -u: uninstall"

exit











elif [ "$1" == "-s" ]



then




 cat torrc > /etc/tor/torrc

trap 'cat Normal_Torrc >/etc/tor/torrc' 1 2 3 9

tor >/dev/null

echo "starting in 10 second"


echo "link to join-:"

cat /var/lib/tor/hidden_service/hostname

echo -e "server should be host on same port 8080 and join port = 80\n"

torsocks python3 chat_server.py



elif [ "$1" == "-c" ]

then 



tor >/dev/null
echo "starting in 10 second"
sleep 10
torsocks python3 chat_client.py



elif [ "$1" == "-u" ] || [ "$1" == "--uninstall" ]

then

cat Normal_Torrc >/etc/tor/torrc









echo "uninstalled"

cd ..

rm -rf TorChat



elif [ "$1" == "-r" ]



then 



echo "reversed"



cat Normal_Torrc >/etc/tor/torrc







else

echo "\033[1;31mERROR"

exit



fi

