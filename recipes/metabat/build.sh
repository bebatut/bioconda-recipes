#!/bin/bash

mkdir -p $PREFIX/bin
scons PREFIX=$PREFIX BOOST_DIR=$PREFIX install
