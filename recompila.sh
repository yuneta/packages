#!/bin/bash

#  Exit immediately if a command exits with a non-zero status.
set -e

##########################################
#       external-libs
##########################################
cd /yuneta/development/yuneta/^gobj-ecosistema/external-libs
./extrae.sh
./configure-libs.sh
./install-libs.sh

##########################################
#       gobj-ecosistema
##########################################
cd /yuneta/development/yuneta/^gobj-ecosistema/ghelpers
rm -r build; mkdir build
cd build; cmake -DCMAKE_BUILD_TYPE=Debug ..
make install

cd /yuneta/development/yuneta/^gobj-ecosistema/timeranger
rm -r build; mkdir build
cd build; cmake -DCMAKE_BUILD_TYPE=Debug ..
make install

cd /yuneta/development/yuneta/^gobj-ecosistema/ytls
rm -r build; mkdir build
cd build; cmake -DCMAKE_BUILD_TYPE=Debug ..
make install

cd /yuneta/development/yuneta/^gobj-ecosistema/ginsfsm
rm -r build; mkdir build
cd build; cmake -DCMAKE_BUILD_TYPE=Debug ..
make install


##########################################
#       yuneta
##########################################
cd /yuneta/development/yuneta/^yuneta/c-core
rm -r build; mkdir build
cd build; cmake -DCMAKE_BUILD_TYPE=Debug ..
make install

cd /yuneta/development/yuneta/^yuneta/c-tls
rm -r build; mkdir build
cd build; cmake -DCMAKE_BUILD_TYPE=Debug ..
make install

cd /yuneta/development/yuneta/^yuneta/c-rc_sqlite
rm -r build; mkdir build
cd build; cmake -DCMAKE_BUILD_TYPE=Debug ..
make install


##########################################
#       yunos
##########################################
cd /yuneta/development/yuneta/^yunos
rm -r build; mkdir build
cd build; cmake -DCMAKE_BUILD_TYPE=Debug ..
make install

##########################################
#       tests
##########################################
cd /yuneta/development/yuneta/^gobj-ecosistema/tests-g
rm -r build; mkdir build
cd build; cmake -DCMAKE_BUILD_TYPE=Debug ..
make install

cd /yuneta/development/yuneta/^yuneta/tests-y
rm -r build; mkdir build
cd build; cmake -DCMAKE_BUILD_TYPE=Debug ..
make install

##########################################
#       all
##########################################
cd /yuneta/development/yuneta
rm -r build; mkdir build
cd build; cmake -DCMAKE_BUILD_TYPE=Debug ..
make install
