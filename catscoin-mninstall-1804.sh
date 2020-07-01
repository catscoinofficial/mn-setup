#!/bin/bash
echo "****************************************************************************"
echo "*CATSCOIN*"                                                                     
echo "*CATSCOIN-LINUX-18.04-VERSION-1.00-SEPUP*"
echo "****************************************************************************"
echo && echo && echo
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "first install ? [y/n]"
read -r DOSETUP
if [ "$DOSETUP" = "y" ]
then
sudo apt-get update
sudo apt -y install software-properties-common
sudo apt -y install unzip
sudo apt-add-repository -y ppa:bitcoin/bitcoin
sudo apt-get update
sudo apt install -y make build-essential libtool software-properties-common autoconf libssl-dev libboost-dev libboost-chrono-dev libboost-filesystem-dev \
libboost-program-options-dev libboost-system-dev libboost-test-dev libboost-thread-dev sudo automake git curl libdb4.8-dev \
bsdmainutils libdb4.8++-dev libminiupnpc-dev libgmp3-dev ufw fail2ban pkg-config libevent-dev libzmq5
echo && echo && echo
sudo wget https://github.com/catscoinofficial/cats/releases/download/v1.0.0/Cats-Linux1804.zip
unzip Cats-Linux1804.zip
sleep 10
chmod +x *
fi
## Setup conf
read -p "ServerIP:" ServerIP
echo IP ist:  "$ServerIP"
mkdir .catscoin
cd .catscoin || exit
wget https://github.com/catscoinofficial/cats/releases/download/v1.0.0/bootstrap.zip
unzip bootstrap.zip
rm -r  bootstrap.zip
cd || exit
echo Configure your masternodes now!
echo "Enter masternode private key for node $ALIAS"
read PRIVKEY
echo "key $COINKEY"
CONF_DIR=~/.catscoin
mkdir -p .catscoin
echo "rpcuser=user"$(shuf -i 100000-10000000 -n 1) >> catscoin.conf
echo "rpcpassword=pass"$(shuf -i 100000-10000000 -n 1) >> catscoin.conf
echo "rpcallowip=127.0.0.1" >> catscoin.conf
echo "listen=1" >> catscoin.conf
echo "server=1" >> catscoin.conf
echo "daemon=1" >> catscoin.conf
echo "bind=$ServerIP" >> catscoin.conf
echo "externalip=$ServerIP" >> catscoin.conf
echo "maxconnections=56" >> catscoin.conf
echo "maxconnections=256" >> catscoin.conf
echo "masternode=1" >> catscoin.conf
echo "masternodeaddr=$ServerIP:22878" >> catscoin.conf
echo "masternodeprivkey=$PRIVKEY" >> catscoin.conf
echo "addnode=95.179.155.62" >> catscoin.conf
mv catscoin.conf $CONF_DIR/catscoin.conf
echo  -e  "$(crontab -l)\n */2 * * * * ./catscoind -datadir=/root/.catscoin -config=/root/.catscoin/catscoin.conf -daemon >/dev/null 2>&1" | crontab -
./catscoind
echo finish