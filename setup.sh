#!/bin/bash

export ROBOSCHOOL_PATH="$( cd "$(dirname "$0")" ; pwd -P )"
cd $ROBOSCHOOL_PATH
rm -rf bullet3
rm -rf $ROBOSCHOOL_PATH/roboschool/cpp-household/bullet_local_install
# git clone https://github.com/feinsteinben/bullet3.git
git clone https://github.com/olegklimov/bullet3 -b roboschool_self_collision
rm -rf bullet3/build
mkdir bullet3/build
cd bullet3/build
cmake -DBUILD_SHARED_LIBS=ON -DUSE_DOUBLE_PRECISION=1 -DCMAKE_INSTALL_PREFIX:PATH=$ROBOSCHOOL_PATH/roboschool/cpp-household/bullet_local_install -DBUILD_CPU_DEMOS=OFF -DBUILD_BULLET2_DEMOS=OFF -DBUILD_EXTRAS=OFF  -DBUILD_UNIT_TESTS=OFF -DBUILD_CLSOCKET=OFF -DBUILD_ENET=OFF -DBUILD_OPENGL3_DEMOS=OFF ..
make -j4
make install
pip install -U $ROBOSCHOOL_PATH

