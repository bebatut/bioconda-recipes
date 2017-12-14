#!/bin/bash

mkdir -p $PREFIX/bin

2to3 SConstruct -W
scons PREFIX=$PREFIX BOOST_DIR=$PREFIX install
