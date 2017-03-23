#!/usr/bin/env bash
if  which bitcoin-cli 2>/dev/null; then
    echo 'bitcoin exist'
    bitcoin-cli backupwallet /tmp/backp.dat
    bitcoin-cli stop
else
    echo 'bitcoin does not exist'
fi

sudo apt-get remove bitcoin*
sudo rm /etc/apt/source.list.d/bitcoin-*.*
sudo add-apt-repository ppa:bitcoin-unlimited/bu-ppa-nightly
sudo apt-get update
sudo apt-get install bitcoind
