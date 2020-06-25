#!/bin/bash

cd ~
echo "****************************************************************************"
echo "* Catscoin*"
echo "*                                                                          *"
echo "* Catscoin  masternodes.*"
echo "****************************************************************************"
echo && echo && echo
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"

echo "first install ? [y/n]"
read DOSETUP
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

if [ $DOSETUP = "y" ]
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
sudo wget https://github.com/catscoinofficial/cats/releases/download/v1.0.0/Cats-Linux1604.zip
unzip Cats-Linux1604.zip

chmod +x *
fi

 ## Setup conf
 read -p "ServerIP:" ServerIP
 echo IP ist:  $ServerIP
 mkdir .catscoin

cd
 echo Configure your masternodes now!
 echo "Enter masternode private key for node $ALIAS"
 read PRIVKEY
 echo "key $COINKEY"
  CONF_DIR=~/.catscoin
  mkdir -p .catscoin
  echo "rpcuser=user"`shuf -i 100000-10000000 -n 1` >> catscoin.conf
  echo "rpcpassword=pass"`shuf -i 100000-10000000 -n 1` >> catscoin.conf
  echo "rpcallowip=127.0.0.1" >> catscoin.conf
  echo "rpcport=22879" >> catscoin.conf
  echo "listen=0" >> catscoin.conf
  echo "server=1" >> catscoin.conf
  echo "daemon=1" >> catscoin.conf
  echo "bind=$ServerIP" >> catscoin.conf
  echo "externalip=$ServerIP" >> catscoin.conf
  echo "maxconnections=256" >> catscoin.conf
  echo "masternode=1" >> catscoin.conf
  echo "port=22879" >> catscoin.conf
  echo "masternodeaddr=$ServerIP:22878" >> catscoin.conf
  echo "masternodeprivkey=$PRIVKEY" >> catscoin.conf
  mv catscoin.conf $CONF_DIR/catscoin.conf
./catscoind
sleep 15
./catscoin-cli getinfo
 done



