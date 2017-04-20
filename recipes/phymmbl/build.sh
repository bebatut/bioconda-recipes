#!/bin/bash

mkdir -p $PREFIX/bin
mkdir -p $PREFIX/data

cp *.pl $PREFIX/bin
cp .scripts/*.pl $PREFIX/bin
cp .scripts/.taxonomyInfo/*.pl $PREFIX/bin
chmod +x $PREFIX/bin/*.pl

ls $PREFIX/bin/*.pl | xargs sed -i.bak -e '1 s|^.*$|#!/usr/bin/env perl|g'
ls $PREFIX/bin/*.pl | xargs sed -i.bak -e 's|.scripts/||g'
ls $PREFIX/bin/*.pl | xargs sed -i.bak -e 's|.icmCode/bin/||g'
ls $PREFIX/bin/*.pl | xargs sed -i.bak -e 's|.taxonomyInfo/||g'

cd .scripts/.icmCode
tar xzf glimmer3_plusSS.tgz
ls
cd SimpleMake
mv icm_newgcc.cc icm.cc
mv gene_newgcc.cc gene.cc
mv delcher_newgcc.hh delcher.hh
make
cd ../
cp bin/* $PREFIX/bin
cd ../../
pwd

cp -r .taxonomyData/* $PREFIX/data
ls $PREFIX/bin/*.pl | xargs sed -i.bak -e 's|.taxonomyData/|../data/|g'