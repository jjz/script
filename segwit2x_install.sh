#!/usr/bin/env bash
set -ex
if which bitcoin-cli 2>/dev/null; then
    echo 'bitcoin client exist'
else
    echo 'bitcoin clent does not exist'
fi
bitcoin_path="bitcoin-btc1"

if [ ! -d "$bitcoin_path" ]; then
    git clone git@github.com:btc1/bitcoin.git $bitcoin_path
    sudo apt-get install build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils
    sudo apt-get install libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-program-options-dev libboost-test-dev libboost-thread-dev
    sudo apt-get install libboost-all-dev
    cd $bitcoin_path
    git checkout segwit2x
else
    cd $bitcoin_path
    git pull
fi

./autogen.sh
./configure  --without-gui  --disable-wallet
make && make check
sudo make install

bitcoind -testnet --daemon