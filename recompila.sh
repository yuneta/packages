#!/bin/bash

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
#  Exit immediately if a command exits with a non-zero status.
set -e

cd /yuneta/development/yuneta/^gobj-ecosistema/ghelpers
rm -rf build; mkdir build
cd build; cmake -DCMAKE_BUILD_TYPE=Debug ..
make install

cd /yuneta/development/yuneta/^gobj-ecosistema/timeranger
rm -rf build; mkdir build
cd build; cmake -DCMAKE_BUILD_TYPE=Debug ..
make install

cd /yuneta/development/yuneta/^gobj-ecosistema/ytls
rm -rf build; mkdir build
cd build; cmake -DCMAKE_BUILD_TYPE=Debug ..
make install

cd /yuneta/development/yuneta/^gobj-ecosistema/ginsfsm
rm -rf build; mkdir build
cd build; cmake -DCMAKE_BUILD_TYPE=Debug ..
make install


##########################################
#       yuneta
##########################################
cd /yuneta/development/yuneta/^yuneta/c-core
rm -rf build; mkdir build
cd build; cmake -DCMAKE_BUILD_TYPE=Debug ..
make install

cd /yuneta/development/yuneta/^yuneta/c-tls
rm -rf build; mkdir build
cd build; cmake -DCMAKE_BUILD_TYPE=Debug ..
make install

cd /yuneta/development/yuneta/^yuneta/c-rc_sqlite
rm -rf build; mkdir build
cd build; cmake -DCMAKE_BUILD_TYPE=Debug ..
make install

cd /yuneta/development/yuneta/^yuneta/c-rc_treedb
rm -rf build; mkdir build
cd build; cmake -DCMAKE_BUILD_TYPE=Debug ..
make install


##########################################
#       yunos
##########################################
cd /yuneta/development/yuneta/^yunos
rm -rf build; mkdir build
cd build; cmake -DCMAKE_BUILD_TYPE=Debug ..
make install

##########################################
#       tests
##########################################
cd /yuneta/development/yuneta/^gobj-ecosistema/tests-g
rm -rf build; mkdir build
cd build; cmake -DCMAKE_BUILD_TYPE=Debug ..
make install

cd /yuneta/development/yuneta/^yuneta/tests-y
rm -rf build; mkdir build
cd build; cmake -DCMAKE_BUILD_TYPE=Debug ..
make install

##########################################
#       all
##########################################
cd /yuneta/development/yuneta
rm -rf build; mkdir build
cd build; cmake -DCMAKE_BUILD_TYPE=Debug ..
make install
