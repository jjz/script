#! /bin/bash
sudo apt-get install cmake  build-essential  libgtk2.0-dev libjpeg8-dev  libjpeg-dev  libavcodec-dev libavformat-dev  libtiff5-dev cmake libswscale-dev libjasper-dev
wget https://codeload.github.com/opencv/opencv/tar.gz/2.4.13
tar -xzvf 2.4.13.tar.gz
cd opencv-2.4.13
cmake
make
sudo make install

sudo apt-get install python-opencv
